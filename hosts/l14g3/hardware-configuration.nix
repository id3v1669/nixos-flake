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
      luks.devices."luks-38a6644b-b8ab-4752-b768-7a402b2ff207".device = "/dev/disk/by-uuid/38a6644b-b8ab-4752-b768-7a402b2ff207";
    };
  };
  

  fileSystems."/" ={ 
    device = "/dev/disk/by-uuid/39d5024a-cfaf-438f-aed2-ddcdf0b36315";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/9C51-96BF";
    fsType = "vfat";
  };

  swapDevices = [ ]; 

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}