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
    device = "/dev/disk/by-uuid/a8a42c8c-f9b7-4f4e-91da-c5547bc6675e";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/0D99-00E1";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  swapDevices = [ ]; 

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}