{ pkgs
, uservars
, ...
}:
{
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
    ./../../modules/swhkd.nix
    ./../../modules/sudo.nix
    ./../../modules/sops.nix
    ./../../modules/bluetooth.nix
    ./../../modules/greeters/regreet.nix
    ./../../modules/input-remapper.nix
  ];

  networking = {
    firewall.enable = false;
    enableIPv6 = false;
  };
  programs.corectrl = {
    enable = true;
    gpuOverclock.enable = true;
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
    ];
    etc."hypr/monitor-init.conf".text = ''
monitor=DP-1,3440x1440@144,0x0,1
monitor=DP-2,disable
    '';
  };
  nix.settings = {
    cores = 8;
    substituters = ["https://nix-gaming.cachix.org"];
    trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
  };
}
