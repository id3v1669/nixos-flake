{ config, lib, pkgs, modulesPath, uservars, curversion, brightnesctrl, ... }:
{
  imports =[ 
    ./hardware-configuration.nix
    ./../configuration.nix
    ./../../modules/virtualisation.nix
    ./../../modules/udevrules.nix
    ./../../modules/fonts.nix
    ./../../modules/sound.nix
    ./../../modules/gpu.nix
    ./../../modules/swhkd.nix
    ./../../modules/sudo.nix
  ];
  
  networking.firewall.enable = false;
  users.users.${uservars.name}.extraGroups = [ 
    "wheel"
    "networkmanager"
    "docker"
    "rustdesk"
    "adbusers"
    "kvm"
    "input" 
    "disk" 
    "qemu-libvirtd"
    "libvirtd"
    "video"
    "wireshark"
    "pipewire"
    "i2c" 
  ];
  environment.variables = {
    #system vars
    EDITOR = "nano";
  };
  system.stateVersion = "${curversion}";
}
