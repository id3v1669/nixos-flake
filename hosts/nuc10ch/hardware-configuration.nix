{ pkgs
, config
, lib
, modulesPath
, system
, ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    kernelModules = [ "kvm-intel" ];
    kernelPackages = pkgs.linuxPackages_latest;
    kernel.sysctl."kernel.unprivileged_userns_clone" = 1;
    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
    ];
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "sd_mod" "usbhid" ];
      kernelModules = [ "amdgpu" ];
    };
  };

  fileSystems."/" ={ 
    device = "/dev/disk/by-uuid/9e67ad3a-3900-4855-92c4-828a53d4d8f2";
    fsType = "xfs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/E611-6933";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  swapDevices = [ ]; 

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}