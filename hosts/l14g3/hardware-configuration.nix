{
  config,
  lib,
  pkgs,
  modulesPath,
  system,
  ...
}: {
  imports = [(modulesPath + "/installer/scan/not-detected.nix")];

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
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
    initrd = {
      availableKernelModules = ["nvme" "xhci_pci" "uas" "sd_mod" "sdhci_pci"];
      kernelModules = ["amdgpu"];
      luks.devices."luks-6050a80c-f2a4-4040-83a9-792e091aade6".device = "/dev/disk/by-uuid/6050a80c-f2a4-4040-83a9-792e091aade6";
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/6d31cfe4-4971-4bb4-9103-3b148f9c27c5";
    fsType = "xfs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/C8AA-8835";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  swapDevices = [];

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}
