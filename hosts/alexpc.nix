{ config, lib, pkgs, modulesPath, ... }:
{
  imports =
    [ 
      (modulesPath + "/installer/scan/not-detected.nix")
      ./configuration
    ];


  boot = {
    kernelModules = [ "kvm-intel" "i2c-dev" "i2c-i801" ];
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod" "sdhci_pci" ];
      kernelModules = [ "amdgpu" ];
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
  
  networking.firewall.enable = false;
  users.users.${uservars.name}.extraGroups = [ 
    "wheel"
    "networkmanager"
    "docker"
    "rustdesk"
    "adbusers"
    "kvm"
    "input" 
    "disk" 
    "qemu-libvirtd"
    "libvirtd"
    "video"
    "wireshark"
    "pipewire"
    "i2c" 
  ];

}