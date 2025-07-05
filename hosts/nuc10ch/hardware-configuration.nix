{
  pkgs,
  config,
  lib,
  modulesPath,
  system,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    kernelModules = ["kvm-intel"];
    kernelPackages = pkgs.linuxPackages_cachyos;
    kernel.sysctl = {
      "kernel.unprivileged_userns_clone" = 1;
      "vm.max_map_count" = 2147483642;
      "kernel.split_lock_mitigate" = 0;
      "net.ipv4.tcp_fin_timeout" = 5;
      "kernel.sched_cfs_bandwidth_slice_us" = 3000;
    };
    extraModulePackages = with config.boot.kernelPackages; [
     v4l2loopback
    ];
    initrd = {
      availableKernelModules = ["nvme" "xhci_pci" "ahci" "usb_storage" "sd_mod" "usbhid"];
      kernelModules = ["amdgpu"];
    };
  };

 fileSystems."/" = {
    device = "/dev/disk/by-uuid/fddd6838-2b28-411e-bb4c-94d6b16f8f5f";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/E554-A623";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  swapDevices = [];

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}
