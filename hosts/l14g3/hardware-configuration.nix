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
      availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod" "sdhci_pci" ];
      kernelModules = [ "amdgpu" ];
      luks.devices."luks-047c14f8-56bf-41fb-8bc4-4ebc6de2d257".device = "/dev/disk/by-uuid/047c14f8-56bf-41fb-8bc4-4ebc6de2d257";
    };
  };
  

  fileSystems."/" ={ 
    device = "/dev/disk/by-uuid/7350493a-6cf4-423a-acfc-b595c9d73f45";
    fsType = "ext4";
  };

  fileSystems."/boot" = { 
    device = "/dev/disk/by-uuid/F07A-952A";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  swapDevices = [ ]; 

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}