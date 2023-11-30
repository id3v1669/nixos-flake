{ config, lib, pkgs, modulesPath, uservars, system, ... }:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    kernelModules = [ "kvm-amd" "i2c-dev" "i2c-piix4" ];
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod" "sdhci_pci" ];
      kernelModules = [ "amdgpu" ];
      luks.devices."luks-9eb807dd-c147-47d9-8865-8c8281f401f4".device = "/dev/disk/by-uuid/9eb807dd-c147-47d9-8865-8c8281f401f4";
    };
  };

  fileSystems."/" ={ 
    device = "/dev/disk/by-uuid/ba2ca1b8-635e-4182-b540-5a991aed0c5c";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/0438-5961";
    fsType = "vfat";
  };

  swapDevices = [ ]; 

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}