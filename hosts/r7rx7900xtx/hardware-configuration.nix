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
    kernelPackages = let
      customKernel = pkgs.linuxPackages_cachyos.kernel.override {
        config = lib.recursiveUpdate pkgs.linuxPackages_cachyos.kernel.config {
          "CONFIG_MZEN3" = "y";
          "CONFIG_GENERIC_CPU" = "n";
        };
      };
    in
      pkgs.linuxPackagesFor customKernel;

    kernelParams = [
      "amd_iommu=on"
      "pcie_aspm=off"
      "iommu=pt"
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
      ];
      kernelModules = [
        "amdgpu"
      ];
    };
    extraModprobeConfig = ''
      options kvm_amd nested=1
      options kvm ignore_msrs=1 report_ignored_msrs=0
    '';
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
