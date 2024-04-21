{ config
, lib
, modulesPath
, system
, ...
}:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    kernelModules = [ "kvm-amd" "i2c-dev" "i2c-piix4" ];
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod" "sdhci_pci" ];
      kernelModules = [ "amdgpu" ];
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