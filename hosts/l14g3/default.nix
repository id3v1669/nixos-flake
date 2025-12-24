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
    ./../../modules/odoo.nix
    ./../../modules/greeters/regreet.nix
    #./../../modules/greeters/sddm.nix
  ];

  #services.power-profiles-daemon.enable = true;

  hardware = {
    enableAllFirmware = true;
    uinput.enable = true;
    steam-hardware.enable = true;
  };
  networking = {
    firewall.enable = false;
    enableIPv6 = false;
  };
  programs = {
    adb.enable = true;
    corectrl.enable = true;
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
  security.wrappers = {
    gamescope = {
      owner = "root";
      group = "root";
      source = "${pkgs.gamescope}/bin/gamescope";
      capabilities = "cap_sys_nice+eip";
    };
  };
  users.users.${uservars.name}.extraGroups = [
    "gamemode"
    "wheel"
    "networkmanager"
    "rustdesk"
    "adbusers"
    "input"
    "disk"
    "i2c"
    "veracrypt"
    "usbmux"
  ];
  environment = {
    systemPackages = with pkgs; [
      ryzenadj
      s-tui
    ];
    etc."hypr/monitor-init.conf".text = ''
      monitor=eDP-1,1920x1080@60,0x0,1
    '';
  };
  specialisation.egpu.configuration = {
    environment.etc."hypr/monitor-init.conf".text = lib.mkForce ''
      monitor=DP-1,3440x1440@144,0x0,1
    '';
  };
  nix.settings = {
    auto-optimise-store = true;
    max-jobs = "auto";
    cores = 0;
    keep-derivations = true;
    keep-outputs = true;
    system-features = [ 
      "nixos-test"
      "benchmark"
      "big-parallel"
      "kvm"
    ];
  };
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
    optimizeRust = pkg:
      pkg.overrideAttrs (old: {
        env =
          (old.env or {})
          // {
            RUSTFLAGS = (old.env.RUSTFLAGS or "") + " -C target-cpu=native -C opt-level=3";
            CARGO_PROFILE_RELEASE_LTO = "true";
            CARGO_PROFILE_RELEASE_CODEGEN_UNITS = "1";
            CARGO_PROFILE_RELEASE_STRIP = "symbols";
          };
      });
  in [
    (final: prev: {
      hyprland = optimizeC prev.hyprland;
      mesa = optimizeC prev.mesa;
    })
  ];
}
