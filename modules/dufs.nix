{
  config,
  pkgs,
  uservars,
  ...
}: {
  sops.secrets.dufs-env.restartUnits = ["dufs.service"];

  systemd.services.dufs = {
    description = "dufs WebDAV server";
    after = ["network.target"];
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      ExecStart = "${pkgs.dufs}/bin/dufs -A --bind 127.0.0.1 --port 8223 /var/lib/dufs";
      DynamicUser = true;
      StateDirectory = "dufs";
      EnvironmentFile = config.sops.secrets.dufs-env.path;
      Restart = "on-failure";
    };
  };

  services.nginx.virtualHosts."dav.${uservars.domain}" = {
    enableACME = true;
    forceSSL = true;
    locations."/" = {
      proxyPass = "http://127.0.0.1:8223";
      extraConfig = ''
        client_max_body_size 0;
        proxy_request_buffering off;
      '';
    };
  };
}
