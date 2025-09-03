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
    '';
    boot = {
      kernelModules = [
        "pci-stub"
      ];
      kernelParams = [
        "pci=pcie_bus_perf" # sets pcie in performance mode, potentialy can help with egpu
        "pci=big_root_window" # re-bar??

        "pcie_aspm=off" # Disable ASPM: potentialy helps to avoid issues with egpu pci power management

        "pci=realloc" # Force PCIe resource reallocation: required for egpu detection
        "pci=assign-busses" # Let kernel assign bus numbers: required for egpu detection
        "pci=nocrs" # Ignore ACPI resource conflicts: required to avoid xhci_hcd error
        "video=efifb:off" # Disable EFI framebuffer: required to show luks on egpu
        "pci-stub.ids=1002:15e7"
      ];
    };
  };

  boot = {
    kernelModules = [
      "kvm-amd"
    ];
    kernelPackages = let
      customKernel = pkgs.linuxPackages_cachyos.kernel.override {
        config = lib.recursiveUpdate pkgs.linuxPackages_cachyos.kernel.config {
          "CONFIG_MZEN3" = "y";
          "CONFIG_GENERIC_CPU" = "n";
        };
      };
    in
      pkgs.linuxPackagesFor customKernel;

    kernelParams = [];
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
      availableKernelModules = ["nvme" "xhci_pci" "uas" "sd_mod" "usbhid"];
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
