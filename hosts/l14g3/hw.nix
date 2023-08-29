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
        configurationLimit = 10;
      };
    };
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod" "sdhci_pci" ];
      kernelModules = [ ];
      luks.devices."luks-cf8f735b-5ddc-4f3c-a720-3479f8588f5a".device = "/dev/disk/by-uuid/cf8f735b-5ddc-4f3c-a720-3479f8588f5a";
    };
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/5230672f-5d6f-4919-a8f6-bf56d691e302";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/3588-1181";
      fsType = "vfat";
    };

  swapDevices = [ ];
  networking = {
    useDHCP = lib.mkDefault true;
    networkmanager.enable = true;
    firewall.enable = false;
    enableIPv6 = false;
  };
  hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  services = {
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          scaling_min_freq = 600000;
          scaling_max_freq = 1300000;
          turbo = "never";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}