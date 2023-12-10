{ config, lib, pkgs, modulesPath, uservars, curversion, ... }:
{
  imports =[ 
    ./hardware-configuration.nix
    ./../configuration.nix
    ./../pcsconf.nix
    ./../../modules/bootloaders/opencore.nix
    ./../../modules/virtualisation.nix
    ./../../modules/udevrules.nix
    ./../../modules/fonts.nix
    ./../../modules/sound.nix
    ./../../modules/gpu.nix
    ./../../modules/sudo.nix
    ./../../modules/swhkd.nix
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