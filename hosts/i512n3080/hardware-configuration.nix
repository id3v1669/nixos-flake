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
      "nvidia_drm"
      "nvidia_modeset"
    ] ++ lib.lists.optionals (gpuvar.tech != "nvk") [
      "nouveau"
    ];
    kernelModules = [ 
      "kvm-intel"
    ] ++ lib.lists.optionals (gpuvar.tech == "nvk") [
      "nouveau"
    ];
    kernelParams = [
    ] ++ lib.lists.optionals (gpuvar.tech == "native") [
      "video=DP-3:3440x1440@144"
      "nvidia_drm.fbdev=1"
    ] ++ lib.lists.optionals (gpuvar.tech == "nvk") [
      "nouveau.config=NvGspRm=1"
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
    device = "/dev/disk/by-uuid/7afcb34c-365c-4505-9609-58eac92c358f";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/E086-5B5C";
    fsType = "vfat";
  };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}
