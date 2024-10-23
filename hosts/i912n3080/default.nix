{ pkgs
, stable
, system
, uservars
, gpuvar
, curversion
, lib
, config
, ...
}:
{
  imports = [ 
    ./hardware-configuration.nix
    ./../configuration.nix
    ./../pcsconf.nix
    ./../../modules/virtualisation.nix
    ./../../modules/fonts.nix
    ./../../modules/sound.nix
    ./../../modules/gpu.nix
    ./../../modules/security.nix
    ./../../modules/swhkd.nix
    ./../../modules/sudo.nix
    ./../../modules/sops.nix
    ./../../modules/bluetooth.nix
  ] ++ lib.lists.optionals (gpuvar.tech != "nvk")[ 
    ./../../modules/greeters/regreet.nix
  ] ++ lib.lists.optionals (gpuvar.tech == "nvk")[
    ./../../modules/greeters/sddm.nix
  ];

  networking = {
    firewall.enable = false;
    enableIPv6 = false;
  };
  
  users.users.${uservars.name}.extraGroups = [
    "users"
    "wheel"
    "networkmanager"
    "rustdesk"
    "adbusers"
    "input" 
    "disk"
    "wireshark"
    "i2c"
    "veracrypt"
    "usbmux"
  ];
  environment = {
    systemPackages = with pkgs; [
    ];
    etc."hypr/monitor-init.conf".text = ''
monitor=DP-3,3440x1440@144,0x0,1
monitor=DP-2,disable
cursor:allow_dumb_copy = false
cursor:no_hardware_cursors = true
render:explicit_sync=0
    '';
  };
  nix.settings = {
    cores = 8;
    substituters = ["https://nix-gaming.cachix.org"];
    trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
  };
  system.stateVersion = "${curversion}";
}
