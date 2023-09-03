{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot = {
    kernelModules = [ "kvm-intel" ];
    kernelParams = [ "nomodeset" "ibt=off" ];
    extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
    initrd = {
      availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usbhid" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
      kernelModules = [ "nvidia" ];##
    };
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/f6b97720-d8d6-4cbf-9300-b0d603fd1178";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/D8D4-A961";
      fsType = "vfat";
    };

  swapDevices = [ ];

  networking = {
    useDHCP = lib.mkDefault true;
    #hostName = "nuc11phnix"; #fix fish aliases
    #hostName = "nixos";
  };

  hardware = {
    nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
  };

  services.xserver.videoDrivers = ["nvidia"];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  #powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
