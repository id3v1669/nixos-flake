{
  config,
  lib,
  pkgs,
  modulesPath,
  system,
  gpuvar,
  ...
}: {
  imports = [(modulesPath + "/installer/scan/not-detected.nix")];

  specialisation.egpu.configuration = {
    system.nixos.tags = ["egpu"];
    services.udev.extraRules = ''
      ACTION=="add", KERNEL=="0000:06:00.0", SUBSYSTEM=="pci", RUN="/bin/sh -c 'echo 1 > /sys/bus/pci/devices/0000:06:00.0/remove'"
      ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="5986", ATTR{idProduct}=="2142", RUN+="/bin/sh -c 'echo 1 > /sys$devpath/remove'"
      #KERNEL=="hidraw*", SUBSYSTEM=="hidraw", TAG+="uaccess"
    '';
    boot = {
      kernelModules = [
        "pci-stub"
      ];
      kernelParams = [
        "pci=pcie_bus_perf" # sets pcie in performance mode, potentialy can help with egpu
        "pci=big_root_window" # re-bar??

        "pcie_aspm=off" # Disable ASPM: potentialy helps to avoid issues with egpu pci power management
        "amd_pstate=active"
        "amd_pstate.shared_mem=0"

        "pci=realloc" # Force PCIe resource reallocation: required for egpu detection
        "pci=assign-busses" # Let kernel assign bus numbers: required for egpu detection
        "pci=nocrs" # Ignore ACPI resource conflicts: required to avoid xhci_hcd error
        "video=efifb:off" # Disable EFI framebuffer: required to show luks on egpu
        "pci-stub.ids=1002:15e7"
      ];
      extraModprobeConfig = ''
        options kvm_amd nested=1
        options kvm ignore_msrs=1 report_ignored_msrs=0
      '';
    };
  };

  boot = {
    supportedFilesystems = ["ntfs" "ntfs3" "exfat" "vfat" "ext4"];
    kernelModules = [
      "kvm-amd"
    ];
    kernelPackages = pkgs.linuxPackages_zen;

    kernelParams = [
      "amd_iommu=on"
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
      ryzen-smu
    ];
    initrd = {
      supportedFilesystems = ["ntfs" "ntfs3" "exfat" "vfat" "ext4"];
      availableKernelModules = ["nvme" "xhci_pci" "ahci" "uas" "sd_mod" "usbhid" "usb_storage"];
      kernelModules = ["amdgpu"];
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
    options = ["fmask=0077" "dmask=0077"];
  };

  swapDevices = [];

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}
