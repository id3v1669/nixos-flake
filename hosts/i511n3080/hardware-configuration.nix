{ config
, lib
, pkgs
, modulesPath
, system
, gpuvar
, ...
}:
{
  imports =[ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    blacklistedKernelModules = [ 
    ] ++ lib.lists.optionals (gpuvar.tech == "nvk") [
      "nvidia"
      "nvidia_uvm"
    ] ++ lib.lists.optionals (gpuvar.tech != "nvk") [
      "nouveau"
    ];
    kernelModules = [ 
      "kvm-intel"
      "i2c-dev"
      "i2c-i801"
    ] ++ lib.lists.optionals (gpuvar.tech == "nvk") [
      "nouveau"
    ];
    kernelParams = [
    ] ++ lib.lists.optionals (gpuvar.tech == "native") [
      "video=HDMI-A-1:3440x1440@100"
      "nvidia_drm.fbdev=1"
    ] ++ lib.lists.optionals (gpuvar.tech == "nvk") [
      "nouveau.config=NvGspRm=1"
      "nouveau.debug=info,VBIOS=info,gsp=debug"
    ];
    kernelPackages = pkgs.linuxPackages_latest;
    kernel.sysctl."kernel.unprivileged_userns_clone" = 1;
    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
    ];
    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod"  ];
      kernelModules = [ ];
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/ac3389d4-9f24-4e9d-9efc-d8b96057e37a";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/7AF9-59CE";
    fsType = "vfat";
  };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}
