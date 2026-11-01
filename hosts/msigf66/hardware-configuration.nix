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
      "kvm-intel"
      "acpi-call"
    ];
    kernelPackages = pkgs.linuxPackages_zen.extend (kfinal: kprev: let
      # nixpkgs merges a signing certificate (<module>.ko.cer) from every external
      # module into modules.cer. These packages install their .ko files without
      # Kbuild's signing step, so sign them the way Kbuild does, after fixup (any
      # later strip would break the signature).
      signed = drv:
        drv.overrideAttrs (old: {
          postFixup =
            (old.postFixup or "")
            + ''
              find "$out/lib/modules" -name '*.ko' -exec ${lib.getExe pkgs.buildPackages.kmodigest} {} \;
            '';
        });
    in {
      acpi_call = signed kprev.acpi_call;
      ddcci-driver = signed kprev.ddcci-driver;
      # Its install runs depmod and ships the modules.* indexes, which collide
      # with the kernel's own when the module tree is merged; those indexes are
      # regenerated for the whole tree anyway
      v4l2loopback = kprev.v4l2loopback.overrideAttrs (old: {
        postInstall =
          (old.postInstall or "")
          + ''
            rm -f "$out"/lib/modules/*/modules.*
          '';
      });
    });
    # aarch64 emulation for building Mi Mix 3 (perseus)
    binfmt.emulatedSystems = ["aarch64-linux"];

    kernelParams = [
      "intel_iommu=on"
      "iommu=pt"
      "ipv6.disable=1"
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
    ];
    initrd = {
      supportedFilesystems = ["ntfs" "ntfs3" "exfat" "vfat" "ext4"];
      availableKernelModules = ["nvme" "xhci_pci" "ahci" "uas" "sd_mod" "usbhid" "usb_storage"];
      kernelModules = ["vfio-pci" "vfio" "vfio_iommu_type1" "i915"];
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
