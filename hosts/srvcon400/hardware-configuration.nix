{ config
, lib
, pkgs
, modulesPath
, ...
}:
{
  imports =
    [ (modulesPath + "/profiles/qemu-guest.nix")
    ];

  boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "virtio_scsi" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
  device = "/dev/mapper/pool-root";
  fsType = "xfs";
};
  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}