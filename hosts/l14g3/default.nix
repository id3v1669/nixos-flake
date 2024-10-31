{ uservars
, curversion
, ...
}:
{
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
    ./../../modules/swhkd.nix
    ./../../modules/bluetooth.nix
    ./../../modules/greeters/regreet.nix
  ];
  
  networking.firewall.enable = false;
  users.users.${uservars.name}.extraGroups = [
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
    etc."hypr/monitor-init.conf".text = ''
      monitor=eDP-1,1920x1080@60,0x0,1
    '';
  };
  system.stateVersion = "${curversion}";
}
