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
    extraModulePackages = with config.boot.kernelPackages; [
      #v4l2loopback
    ];
    initrd = {
      availableKernelModules = ["nvme" "xhci_pci" "uas" "sd_mod" "usbhid"];
      kernelModules = ["amdgpu"];
      luks.devices."luks-7f87ff35-9b2a-4f9e-b679-17055fff4604".device = "/dev/disk/by-uuid/7f87ff35-9b2a-4f9e-b679-17055fff4604";
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
