{ config, lib, pkgs, modulesPath, ... }:
{
  imports =
    [ 
      (modulesPath + "/installer/scan/not-detected.nix")
      ./configuration
    ];

  boot = {
    kernelModules = [ "kvm-intel" "i2c-dev" ];
    kernelParams = [ "nomodeset" "ibt=off" ];
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback nvidia_x11 ];
    initrd = {
      availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usbhid" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
      kernelModules = [ "nvidia" ];
    };
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/f6b97720-d8d6-4cbf-9300-b0d603fd1178";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/D8D4-A961";
      fsType = "vfat";
    };

  swapDevices = [ ];


}
