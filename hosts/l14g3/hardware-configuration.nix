{ config, lib, pkgs, modulesPath, uservars, system, ... }:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    kernelModules = [ "kvm-amd" "i2c-dev" "i2c-piix4" ];
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod" "sdhci_pci" ];
      kernelModules = [ "amdgpu" ];
      luks.devices."luks-85970870-984a-4a67-9cf4-8e11c38a7cac".device = "/dev/disk/by-uuid/85970870-984a-4a67-9cf4-8e11c38a7cac";
    };
  };

  fileSystems."/" ={ 
    device = "/dev/disk/by-uuid/4e32d86d-ac91-4a86-a433-0ed7bda6050d";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/67E3-17ED";
    fsType = "vfat";
  };

  swapDevices = [ ]; 

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}