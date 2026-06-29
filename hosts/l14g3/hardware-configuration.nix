{
  config,
  lib,
  pkgs,
  modulesPath,
  system,
  ...
}: {
  imports = [(modulesPath + "/installer/scan/not-detected.nix")];
  # android mic perms
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="2d0[0-5]", TAG+="uaccess", MODE="0660", GROUP="users"
  '';
  boot = {
    supportedFilesystems = ["ntfs" "ntfs3" "exfat" "vfat" "ext4"];
    kernelModules = [
      "ryzen-smu"
      "kvm-amd"
      "acpi-call"
    ];
    kernelPackages = pkgs.linuxPackages_zen;

    kernelParams = [
      "amd_iommu=on"
      "iommu=pt"
      "amd_pstate=active"
    ];
    kernel.sysctl = {
      "kernel.unprivileged_userns_clone" = 1;
      "vm.max_map_count" = 2147483642;
      "vm.mmap_min_addr" = 0;
      "kernel.split_lock_mitigate" = 0;
      "net.ipv4.tcp_fin_timeout" = 5;
      "kernel.sched_cfs_bandwidth_slice_us" = 3000;
    };
    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
      acpi_call
      ryzen-smu
    ];
    initrd = {
      supportedFilesystems = ["ntfs" "ntfs3" "exfat" "vfat" "ext4"];
      availableKernelModules = ["nvme" "xhci_pci" "ahci" "uas" "sd_mod" "usbhid" "usb_storage"];
      kernelModules = ["vfio-pci" "vfio" "vfio_iommu_type1" "amdgpu"];
      # cryptsetup config /dev/disk/by-uuid/xx --label luks_primary
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
