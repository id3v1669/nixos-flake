{ config
, lib
, modulesPath
, system
, ...
}:
{
  imports =[ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    kernelModules = [ "kvm-intel" "i2c-dev" "i2c-i801" ];
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod" "sdhci_pci" ];
      kernelModules = [ "amdgpu" ];
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/ef2c7e2c-2416-4c8e-aa63-aac033098db5";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/8779-F74A";
    fsType = "vfat";
  };

  swapDevices =[ 
    { device = "/dev/disk/by-uuid/2f2c6529-6cb9-4bbd-9227-4b14ce4bf270"; }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}