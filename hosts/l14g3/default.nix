{ config, lib, pkgs, modulesPath, uservars, curversion, ... }:
{
  imports = [ 
    ./hardware-configuration.nix
    ./../configuration.nix
    ./../../modules/autocpufreq.nix
    ./../../modules/virtualisation.nix
    ./../../modules/udevrules.nix
    ./../../modules/fonts.nix
    ./../../modules/sound.nix
    ./../../modules/gpu.nix
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

  system.stateVersion = "${curversion}";
}