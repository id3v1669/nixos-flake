{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];


  boot = {
#    extraModulePackages = with config.boot.kernelPackages; [
#      v4l2loopback
#    ];
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
    loader = {
      timeout = 15;     
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        #configurationLimit = 10;
      };
    };
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod" "sdhci_pci" ];
      kernelModules = [ ];
    };
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/1f70a523-6311-4785-966c-f929a5f28002";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/6079-C2CD";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/e16bef8b-f19d-4ced-bfda-09321d25ccc8"; }
    ];
  networking = {
    useDHCP = lib.mkDefault true;
    networkmanager.enable = true;
    firewall.enable = false;
    enableIPv6 = false;
  };
  hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}