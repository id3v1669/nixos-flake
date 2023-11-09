{ config, lib, pkgs, modulesPath, ... }:
{
  imports =
    [ 
      (modulesPath + "/profiles/qemu-guest.nix")
      ./configuration
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

  networking.interfaces.ens3.ipv4.addresses = [
    { address = "77.91.123.39"; prefixLength = 24; }
    { address = "77.91.123.50"; prefixLength = 24; }
  ];
  networking.defaultGateway = "77.91.123.1";
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];
  
}