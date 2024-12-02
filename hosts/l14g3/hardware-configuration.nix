{ config
, lib
, pkgs
, modulesPath
, system
, ...
}:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "uas" "sd_mod" "sdhci_pci" ];
      kernelModules = [ "amdgpu" ];
      luks.devices."luks-fc59d57b-0c2d-4ad4-a568-f184fec43a2f".device = "/dev/disk/by-uuid/fc59d57b-0c2d-4ad4-a568-f184fec43a2f";
    };
  };
  

  fileSystems."/" = { 
    device = "/dev/disk/by-uuid/e1d9318a-a709-40fe-a949-c5c4f725c4c3";
    fsType = "xfs";
  };

  fileSystems."/boot" = { 
    device = "/dev/disk/by-uuid/DBB3-A297";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  swapDevices = [ ]; 

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}