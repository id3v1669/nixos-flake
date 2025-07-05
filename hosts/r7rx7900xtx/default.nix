{
  pkgs,
  uservars,
  lib,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./../configuration.nix
    ./../pcsconf.nix
    ./../../modules/virtualisation.nix
    ./../../modules/fonts.nix
    ./../../modules/sound.nix
    ./../../modules/gpu.nix
    ./../../modules/security.nix
    ./../../modules/swhkdp.nix
    ./../../modules/sudo.nix
    ./../../modules/sops.nix
    ./../../modules/bluetooth.nix
    ./../../modules/greeters/regreet.nix
    #./../../modules/greeters/sddm.nix
  ];
  hardware = {
    enableAllFirmware = true;
    amdgpu.overdrive.enable = true;
  };
  services = {
    udev.packages = [
      pkgs.android-udev-rules
    ];
  };
  networking = {
    firewall.enable = false;
    enableIPv6 = false;
  };
  programs = {
    adb.enable = true;
    corectrl = {
      enable = true;
    };
  };
  users.users.${uservars.name}.extraGroups = [
    "users"
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
      config.boot.kernelPackages.perf
    ];
    etc = {
      "hypr/monitor-init.conf".text = ''
        monitor=DP-1,3440x1440@144,0x0,1
        monitor=DP-2,disable
      '';
    };
  };
  nix.settings = {
    auto-optimise-store = true;
    cores = 8;
    substituters = [
      "https://nix-gaming.cachix.org"
      "https://chaotic-nyx.cachix.org/"
    ];
    trusted-public-keys = [
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
    ];
  };
}
