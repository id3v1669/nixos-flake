{ uservars
, ...
}:
{
  imports = [ 
    ./hardware-configuration.nix
    ./../configuration.nix
    ./../pcsconf.nix
    #./../../modules/auto-cpufreq.nix
    #./../../modules/virtualisation.nix
    ./../../modules/fonts.nix
    ./../../modules/sound.nix
    ./../../modules/gpu.nix
    ./../../modules/security.nix
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
    "i2c"
    "veracrypt"
    "usbmux"
  ];
  environment.variables = {
    #system vars
    EDITOR = "nano";
  };
}
