{ config, lib, pkgs, modulesPath, uservars, ... }:
{
  imports =
  [ 
    (modulesPath + "/profiles/qemu-guest.nix")
    ./configuration
    ./../modules/nextcloud.nix
    ./../modules/nginx.nix
    ./../modules/onlyoffice.nix
    ./../modules/sops.nix
    ./../modules/openssh.nix
    ];

  boot = {
    initrd = {
      availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "sr_mod" "virtio_blk" ];
      kernelModules = [ ];
    };
    kernelModules = [ ];
    extraModulePackages = [ ];
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/73017d40-b827-4948-9470-1c418973abf3";
      fsType = "ext4";
    };

  swapDevices = [ ];

  networking = {
    useDHCP = false;
    interfaces.ens3.ipv4.addresses = [
      { address = "77.91.123.39"; prefixLength = 24; }
      { address = "77.91.123.50"; prefixLength = 24; }
    ];
    defaultGateway = "77.91.123.1";
    nameservers = [ "1.1.1.1" "8.8.8.8" ];
    #firewall.allowedTCPPorts = [ 22 80 443 8080 8090 28943 ];
    firewall.enable = false;
  };
  users.users.${uservars.name}.extraGroups = [ 
    "wheel"
    "networkmanager"
    "nextcloud"
  ];
  
}