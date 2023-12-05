{ config, lib, pkgs, modulesPath, uservars, curversion, brightnesctrl, ... }:
{
  imports =[ 
    ./hardware-configuration.nix
    ./../configuration.nix
    ./../pcsconf.nix
    ./../../modules/virtualisation.nix
    ./../../modules/udevrules.nix
    ./../../modules/fonts.nix
    ./../../modules/sound.nix
    ./../../modules/gpu.nix
    ./../../modules/swhkd.nix
    ./../../modules/sudo.nix
  ];
  
  networking = {
    enableIPv6 = true;
    firewall = {
      enable = false;
      checkReversePath = "loose";
    };
    # interfaces =
    #  {
    #   tun0 = {
    #     name = "tun0";
    #     virtual = true;
    #     virtualOwner = "${uservars.name}";
    #     virtualType = "tun";
    #     ipv4 = {
    #       addresses = [
    #       {
    #         address = "198.18.0.1";
    #         prefixLength = 15;
    #       }];
    #       routes = [{
    #         address = "default";
    #         via = "198.18.0.1";
    #         prefixLength = 15;
    #         options = {
    #           metric = "1";
    #         };
    #       }];
    #     };
    #     ipv6 = {
    #       addresses = [
    #       {
    #         address = "fd00:0000:0000:0000:0000:0000:0000:0001";
    #         prefixLength = 64;
    #       }];
    #       routes = [{
    #         address = "default";
    #         via = "fd00:0000:0000:0000:0000:0000:0000:0001";
    #         prefixLength = 64;
    #         options = {
    #           metric = "1";
    #         };
    #       }];
    #     };
    #   };
    #   # enp89s0 = {
    #   #   name = "enp89s0";
    #   #   ipv4 = {
    #   #     addresses = [{
    #   #       address = "192.168.0.72";
    #   #       prefixLength = 24;
    #   #     }];
    #   #     routes = [{
    #   #       address = "default";
    #   #       via = "192.168.0.1";
    #   #       prefixLength = 24;
    #   #     }];
    #   #   };
    #   # };
    # };
  };
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
    "outlinevpn"
  ];
  environment.variables = {
    #system vars
    EDITOR = "nano";
    WLR_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
    ELECTRON_DISABLE_GPU = "1";
  };
  system.stateVersion = "${curversion}";
}
