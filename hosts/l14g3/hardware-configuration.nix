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
      luks.devices."luks-390609de-20b1-43018077-2f800181933d".device = "/dev/disk/by-uuid/390609de-20b1-4301-8077-2f800181933d";
    };
  };

  fileSystems."/" ={ 
    device = "/dev/disk/by-uuid/25557ebf-27f1-48d8-80e5-2d97d0a4e133";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/67E3-17ED";
    fsType = "vfat";
  };

  swapDevices = [ ]; 

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}