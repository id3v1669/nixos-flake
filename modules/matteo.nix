{
  config,
  lib,
  uservars,
  ...
}: let
  # DBR ERP (drill-bit recycling: purchasing, stock, shipping, payments).
  #
  # The application is a compose stack deployed by rsync into ${root};
  # this module owns only what the machine is responsible for — bringing
  # it up at boot, pinning where it listens, and putting a hostname in
  # front of it.
  #
  # It lives here rather than being packaged because it is not a Nix
  # package: the deployment unit is the repository plus a .env file, and
  # its own compose file already describes the four containers (postgres,
  # rails, the job runner and a caddy serving the built SPA).
  domain = "matteo.${uservars.domain}";

  # Where the checkout and its .env live. Not in the flake: .env carries
  # the database password, the JWT secret and the ActiveRecord encryption
  # keys, and this repository is not the place for them.
  root = "/srv/matteo";

  compose = "${root}/docker-compose.staging.yml";

  # The stack's own web tier, on loopback — nginx is the only thing that
  # should be reachable from outside, and it already holds 80/443 for
  # drawdb and odoo.
  webPort = 8090;

  # This host runs podman, not docker (modules/virtualisation.nix), so
  # compose is `podman compose` — a thin wrapper podman ships that hands
  # the arguments to an external provider. The file keeps its
  # docker-compose.staging.yml name because that is its name in the repo;
  # the provider reads the same Compose spec.
  #
  # config.virtualisation.podman.package, NOT pkgs.podman: the provider is
  # found on the podman package's own helper path, which is what
  # `virtualisation.podman.extraPackages = [pkgs.podman-compose]` in
  # modules/virtualisation.nix populates. Plain pkgs.podman fails with
  # "looking up compose provider failed".
  podmanPkg = config.virtualisation.podman.package;
  compose-cmd = "${podmanPkg}/bin/podman compose";
in {
  # rsync has to be able to write here as srvcon400user, and the unit has
  # to find a compose file on the first boot after this module lands.
  # 0750 with root as the group reader: the stack runs as root, deploys
  # run as the login user, nobody else needs to see .env's neighbours.
  systemd.tmpfiles.rules = [
    "d ${root} 0750 ${uservars.name} root -"
    "d ${root}/backups 0750 ${uservars.name} root -"
  ];

  systemd.services.matteo = {
    description = "DBR ERP (${domain})";
    after = ["network-online.target"];
    wants = ["network-online.target"];
    wantedBy = ["multi-user.target"];

    # The provider (podman-compose, a Python program) shells back out to
    # `podman`, so it needs the same wrapped podman on PATH.
    path = [podmanPkg];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      WorkingDirectory = root;

      # Nothing is deployed until the first deploy.sh run. Without this
      # the very nixos-rebuild that introduces the module reports a
      # failed unit, which trains people to ignore the unit's state.
      ConditionPathExists = compose;

      # The compose file's published port is
      # "${WEB_BIND:-0.0.0.0}:${WEB_PUBLISHED_PORT:-80}:80", so with an
      # incomplete .env the web container tries to take 0.0.0.0:80 — the
      # port nginx holds for drawdb. the compose provider layers the process
      # environment over the project .env, so setting them here makes the
      # binding a property of the machine rather than of whatever was
      # last rsynced.
      #
      # Deliberately only these two. Anything in Environment= lands in a
      # world-readable unit file in /nix/store and shows up in
      # `systemctl show`, so secrets must stay in the 0600 .env.
      Environment = [
        "WEB_BIND=127.0.0.1"
        "WEB_PUBLISHED_PORT=${toString webPort}"
      ];

      # No -p: the compose file sets `name: dbr-staging` itself, and
      # overriding it would repoint the named volumes at empty ones —
      # postgres would initialise a fresh database and the ERP would come
      # up looking wiped.
      #
      # No --build either: this is the boot path, and it must be fast and
      # deterministic. Deploying new code is `up -d --build`, run by the
      # person deploying it. `systemctl restart matteo` restarts the
      # containers you already have.
      ExecStart = "${compose-cmd} -f ${compose} up -d --remove-orphans";
      ExecStop = "${compose-cmd} -f ${compose} down";

      # Pulling images and running migrations on a cold boot takes longer
      # than the default 90 seconds.
      TimeoutStartSec = "15min";
    };
  };

  services.nginx.virtualHosts.${domain} = {
    enableACME = true;
    forceSSL = true;

    # Host and X-Forwarded-Proto come from recommendedProxySettings,
    # enabled globally in modules/nginx.nix. Rails' config.hosts checks
    # the Host header, so without it every request 403s.
    locations."/" = {
      proxyPass = "http://127.0.0.1:${toString webPort}";
      extraConfig = ''
        # Supplier documents and scale photos; the application refuses
        # anything larger than 25 MB itself (Attachments::Store).
        client_max_body_size 30m;
      '';
    };

    # Live updates (req 1). Without proxyWebsockets the page loads and
    # then never refreshes by itself, which is the kind of failure people
    # describe as "it feels stale" rather than reporting as broken.
    locations."/cable" = {
      proxyPass = "http://127.0.0.1:${toString webPort}";
      proxyWebsockets = true;
      extraConfig = ''
        # ActionCable heartbeats every 3 seconds, so a long read timeout
        # buys nothing and only holds dead sockets open on an nginx this
        # host shares with drawdb and odoo.
        proxy_read_timeout 75s;
      '';
    };

    # Liveness only, and only from the host. Exact match: a prefix
    # location would also swallow /uploads and any SPA route starting
    # "up", and Caddy's own matcher behind this is exact too.
    locations."= /up" = {
      proxyPass = "http://127.0.0.1:${toString webPort}";
      extraConfig = ''
        allow 127.0.0.1;
        deny all;
        access_log off;
      '';
    };
  };

  # Operating the stack without a password prompt mid-incident.
  #
  # security.sudo, not security.sudo-rs: this host does not import
  # modules/sudo.nix, so sudo-rs is off here and rules written against it
  # would be silently dropped.
  #
  # This is convenience, not a privilege boundary: wheel on this host is
  # already `ALL=(ALL:ALL) SETENV: ALL`, one password away from root, and
  # anyone who can write ${compose} decides what root runs at the next
  # restart — so keep ${root} owned by someone you would give root to.
  #
  # Both spellings and the diagnostics are listed on purpose. sudoers
  # matches the exact argv, and a rule that fails on the form people
  # actually type is a rule someone widens to ALL under pressure.
  #
  # `up -d --build` — what deploy.sh runs — is deliberately NOT here: it
  # builds and runs whatever was last rsynced, so it should cost a
  # password.
  security.sudo.extraRules = [
    {
      groups = ["wheel"];
      commands = let
        systemctl = "/run/current-system/sw/bin/systemctl";
        journalctl = "/run/current-system/sw/bin/journalctl";
        nopasswd = command: {
          inherit command;
          options = ["NOPASSWD"];
        };
      in
        map nopasswd (
          lib.concatMap (verb: [
            "${systemctl} ${verb} matteo"
            "${systemctl} ${verb} matteo.service"
          ]) ["start" "stop" "restart" "status"]
          ++ [
            # Type=oneshot with RemainAfterExit reports "active (exited)"
            # whatever the containers are doing, so the honest health
            # check is the container list, not the unit state.
            #
            # The trailing wildcard is the point: sudoers matches the
            # exact argv, and the bare form alone failed the first time
            # anyone typed `journalctl -u matteo.service --no-pager`.
            # Scoped to this unit, and journalctl only reads.
            "${journalctl} -u matteo.service"
            "${journalctl} -u matteo.service *"
          ]
          ++
          # Both the store path and the profile path: sudoers compares
          # the command sudo resolved off PATH, without following
          # symlinks, so `sudo podman compose ...` matches only the
          # /run/current-system spelling — while the unit above, and
          # anyone copying its ExecStart, uses the store one. The store
          # path also goes stale on a nixpkgs bump; the profile one does
          # not.
          #
          # Spelled out rather than wildcarded, unlike journalctl above:
          # `${podmanPkg}/bin/podman compose -f ${compose} *` would also
          # match `up -d --build`, handing away the one thing that is
          # meant to cost a password.
          lib.concatMap (pc:
            map (sub: "${pc} compose -f ${compose} ${sub}") [
              "ps"
              "ps -a"
              "logs"
              "logs -f"
              "logs --tail=200"
            ])
          ["${podmanPkg}/bin/podman" "/run/current-system/sw/bin/podman"]
        );
    }
  ];
}
