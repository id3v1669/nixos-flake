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
  # disable bluetooth until propper antennas bought as usb is faster
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="8087", ATTR{idProduct}=="0a2a", ATTR{authorized}="0"
  '';
  boot = {
    kernelModules = ["kvm-intel"];

    kernelPackages = pkgs.linuxPackages_latest;

    # disable wifi until propper antennas bought as usb is faster
    kernelParams = ["pci-stub.ids=8086:095a"];

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
      availableKernelModules = ["nvme" "xhci_pci" "ahci" "usb_storage" "uas" "sd_mod" "usbhid"];
      kernelModules = ["amdgpu" "pci-stub"];
      luks.devices.primary.device = "/dev/disk/by-label/luks_primary";
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/EFI";
    fsType = "vfat";
  };

  swapDevices = [];

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}
