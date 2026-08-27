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
     # Pixel as microphone (AOA accessory mode)
    SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="2d0[0-5]", TAG+="uaccess", MODE="0660", GROUP="users"
    # Mi Mix 3: adb/fastboot/recovery
    SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", MODE="0660", TAG+="uaccess", GROUP="users"
    # Mi Mix 3: Xiaomi MTP/PTP modes
    SUBSYSTEM=="usb", ATTR{idVendor}=="2717", MODE="0660", TAG+="uaccess", GROUP="users"
    # Qualcomm EDL mode (unbrick/flash)
    SUBSYSTEM=="usb", ATTR{idVendor}=="05c6", ATTR{idProduct}=="9008", MODE="0660", TAG+="uaccess", GROUP="users"
  '';
  boot = {
    supportedFilesystems = ["ntfs" "ntfs3" "exfat" "vfat" "ext4"];
    kernelModules = [
      "ryzen-smu"
      "kvm-amd"
      "acpi-call"
    ];
    kernelPackages = pkgs.linuxPackages_zen; # modules not updated for latest yet
    # aarch64 emulation for building Mi Mix 3 (perseus)
    binfmt.emulatedSystems = ["aarch64-linux"];

    kernelParams = [
      "amd_iommu=on"
      "iommu=pt"
      "amd_pstate=active"
      "usbcore.quirks=18d1:d00d:k"
      #"amdgpu.dc_feature_mask=0x400" when 7.2 lands for hdmi
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
