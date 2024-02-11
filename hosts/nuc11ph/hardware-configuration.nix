{ config
, lib
, pkgs
, modulesPath
, system
, gpuvar
, ...
}:
{
  imports =[ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    blacklistedKernelModules = [ ] ++ lib.lists.optionals (gpuvar.type == "nvk") ["nvidia" "nvidia_uvm" ];
    kernelModules = [ "kvm-intel" "i2c-dev" "i2c-i801" ] ++ lib.lists.optionals (gpuvar.type == "nvk") [ "nouveau" ];
    kernelParams = [
      "i915.force_probe=9a49"
    ] ++ lib.lists.optionals (gpuvar.type == "nvk") [
      "nouveau.config=NvGspRm=1"
      "nouveau.debug=info,VBIOS=info,gsp=debug"
    ];
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    initrd = {
      availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usbhid" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
      kernelModules = [ ];
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/f6b97720-d8d6-4cbf-9300-b0d603fd1178";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/D8D4-A961";
    fsType = "vfat";
  };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}
