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
      ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="5986", ATTR{idProduct}=="2142", RUN+="/bin/sh -c 'echo 1 > /sys$devpath/remove'"
    '';
    boot = {
      kernelModules = [
        "pci-stub"
      ];
      kernelParams = [
        "vfio-pci.ids=1002:15e7"
        "pci=pcie_bus_perf" # sets pcie in performance mode, potentialy can help with egpu
        "pci=big_root_window" # re-bar??

        "amd_pstate=active"
        "amd_pstate.shared_mem=0"

        "pci=nocrs" # Ignore ACPI resource conflicts: required to avoid xhci_hcd error

        # temporary returned back as egpu-init.efi overflows nvram and needs to be fixed
        #"pci=realloc"
        #"pci=assign-busses"
      ];
      extraModprobeConfig = ''
        softdep amdgpu pre: vfio-pci
        options kvm_amd nested=1
        options kvm ignore_msrs=1 report_ignored_msrs=0
      '';
    };
  };

  boot = {
    supportedFilesystems = ["ntfs" "ntfs3" "exfat" "vfat" "ext4"];
    kernelModules = [
      "ryzen-smu"
      "kvm-amd"
    ];
    kernelPackages = pkgs.linuxPackages_zen;

    kernelParams = [
      "amd_iommu=on"
      "iommu=pt"
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
