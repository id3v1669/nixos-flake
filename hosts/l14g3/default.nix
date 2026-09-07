{
  uservars,
  config,
  pkgs,
  stable,
  inputs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./../configuration.nix
    ./../pcsconf.nix
    ./../../modules/auto-cpufreq.nix
    ./../../modules/virtualisation.nix
    ./../../modules/fonts.nix
    ./../../modules/sound.nix
    ./../../modules/gpu.nix
    ./../../modules/security.nix
    ./../../modules/sudo.nix
    ./../../modules/swhkdp.nix
    ./../../modules/bluetooth.nix
    #./../../modules/odoo.nix
    ./../../modules/greeters/sddm.nix
  ];
  hardware = {
    enableAllFirmware = true;
    uinput.enable = true;
    amdgpu.opencl.enable = true;
    graphics.extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];
  };
  services.xserver.videoDrivers = ["displaylink"];

  networking = {
    firewall.enable = false;
    enableIPv6 = false;
  };
  programs = {
    gamemode = {
      enable = true;
      settings = {
        general = {
          reaper_freq = 5;
          desiredgov = "performance";
          softrealtime = "auto";
          ioprio = 0;
        };
        cpu = {
          park_cores = "yes";
          pin_cores = "yes";
        };
        custom = {
          start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
          end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
          script_timeout = 10;
        };
      };
    };
  };
  users.users.${uservars.name}.extraGroups = [
    "gamemode"
    "wheel"
    "networkmanager"
    "rustdesk"
    "input"
    "disk"
    "i2c"
    "veracrypt"
    "usbmux"
  ];
  services.ddccontrol.enable = true;
  systemd.services.surrealdb.serviceConfig.ProcSubset = lib.mkForce "all";
  systemd.services.surrealdb.environment.SURREAL_BUCKET_FOLDER_ALLOWLIST = "/var/lib/surrealdb/buckets";
  systemd.services.surrealdb.serviceConfig.StateDirectory = [
    "surrealdb"
    "surrealdb/buckets"
  ];
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_18;
    settings.port = 5432;
    authentication = lib.mkBefore ''
      host all all 127.0.0.1/32 trust
      host all all ::1/128      trust
    '';
    ensureDatabases = ["devdb"];
    ensureUsers = [
      {
        name = uservars.name;
        ensureClauses = {
          login = true;
          superuser = true;
          createdb = true;
          createrole = true;
        };
      }
    ];
  };
  services = {
    surrealdb = {
      enable = true;
      package = pkgs.surrealdbx;
      dbPath = "surrealkv:///var/lib/surrealdb";
      port = 8000;
      extraFlags = ["--allow-all" "--user" "root" "--pass" "root" "--allow-experimental" "files"];
    };
    auto-cpufreq.settings = {
      charger = {
        governor = "performance";
        scaling_min_freq = 2000000;
        #l14g3 is half-dead, guard to prevent crashes
        scaling_max_freq = 3600000;
        turbo = "never";
      };
    };
  };
  environment.systemPackages = with pkgs; [
    uv
    awscli2
    obsidian
    displaylink
    camunda-modeler
    apfs-fuse
    fuse
    android-tools
    android-mic
    #rustdesk
    rustdesk-flutter
    surrealistx
    dbeaver-bin
    wlrctl
    wtype
    ryzenadj
    proton-vpn
    claude-code
    opencode
    graphify
  ];
  nix.package = pkgs.nixVersions.latest;
  nix.settings = {
    auto-optimise-store = true;
    max-jobs = 2;
    cores = 5;
    keep-derivations = true;
    keep-outputs = true;
    system-features = [
      "nixos-test"
      "benchmark"
      "big-parallel"
      "kvm"
    ];
  };
  systemd.services.nix-daemon.serviceConfig.AllowedCPUs = "0-9";
  nixpkgs.overlays = let
    cFlags = ["-O3" "-pipe" "-march=znver3" "-mtune=znver3"];

    optimizeC = pkg:
      pkg.overrideAttrs (old: {
        env =
          (old.env or {})
          // {
            NIX_CFLAGS_COMPILE = (old.env.NIX_CFLAGS_COMPILE or "") + " " + toString cFlags;
          };
      });
  in [
    (final: prev: {
      #hyprland = optimizeC prev.hyprland;
      #mesa = optimizeC prev.mesa;
    })
  ];
}
