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
    kernelModules = ["kvm-amd"];
    #kernelPackages = pkgs.linuxPackages_zen; //zen for acs patch
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "amd_iommu=on"
      "iommu=pt"
      #"pcie_acs_override=downstream,multifunction"
      #"vfio-pci.ids=1002:73ff,1002:ab28"
    ];
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
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usbhid"
        "uas"
        "usb_storage"
        "sd_mod"
        #"vfio"
        #"vfio_pci"
        #"vfio_iommu_type1"
      ];
      kernelModules = [
        #"vfio"
        #"vfio_pci"
        #"vfio_iommu_type1"

        "amdgpu"
      ];
    };
    # extraModprobeConfig = ''
    #  options vfio-pci ids=1002:73ff,1002:ab28
    #  softdep amdgpu pre: vfio-pci
    # '';
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
