{
  uservars,
  config,
  pkgs,
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
    ./../../modules/greeters/regreet.nix
    #./../../modules/greeters/sddm.nix
  ];

  hardware = {
    enableAllFirmware = true;
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
      source = "${inputs.chaotic.packages.${pkgs.stdenv.hostPlatform.system}.gamescope_git}/bin/gamescope";
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
    systemPackages = [];
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
    cores = 8;
    substituters = [
      "https://chaotic-nyx.cachix.org/"
    ];
    trusted-public-keys = [
      "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
    ];
  };
}
