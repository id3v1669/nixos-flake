{ uservars
, curversion
, ...
}:
{
  imports = [ 
    ./hardware-configuration.nix
    ./../configuration.nix
    ./../pcsconf.nix
    #./../../modules/virtualisation.nix
    ./../../modules/fonts.nix
    ./../../modules/sound.nix
    ./../../modules/gpu.nix
    ./../../modules/sudo.nix
    ./../../modules/swhkd.nix
    ./../../modules/bluetooth.nix
  ];
  
  networking.firewall.enable = false;
  users.users.${uservars.name}.extraGroups = [
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
    etc."hypr/monitor-init.conf".text = ''
      monitor=DP-3,3440x1440@144,0x0,1
      monitor=DP-2,disable
    '';
  };
  system.stateVersion = "${curversion}";
}