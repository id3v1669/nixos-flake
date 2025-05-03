{
  pkgs,
  uservars,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./../configuration.nix
    ./../pcsconf.nix
    ./../../modules/virtualisation.nix
    ./../../modules/openlinkhub.nix
    ./../../modules/fonts.nix
    ./../../modules/sound.nix
    ./../../modules/gpu.nix
    ./../../modules/security.nix
    ./../../modules/swhkdp.nix
    ./../../modules/sudo.nix
    ./../../modules/sops.nix
    ./../../modules/bluetooth.nix
    ./../../modules/greeters/regreet.nix
  ];
  services = {
    touchegg.enable = true;
    searx = {
      enable = true;
      settings = {
        server = {
          port = 8888;
          bind_address = "127.0.0.1";
          secret_key = "64ZapANvagul";
        };
      };
    };
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
      gpuOverclock.enable = false;
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
      searxng
    ];
    etc = {
      "hypr/monitor-init.conf".text = ''
        monitor=DP-1,3440x1440@144,0x0,1
        monitor=DP-2,disable
      '';
      # "libinput/local-overrides.quirks".text = ''
      #   [Touchpad touch override]
      #   MatchUSBID="05ac:0265"
      #   Driver "synaptics"
      #   AttrPressureRange=4:0
      # '';
    };
  };
  nix.settings = {
    auto-optimise-store = true;
    cores = 8;
    substituters = ["https://nix-gaming.cachix.org"];
    trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
  };
}
