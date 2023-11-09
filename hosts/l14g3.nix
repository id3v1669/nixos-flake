{ config, lib, pkgs, modulesPath, uservars, ... }:
{
  imports = [ 
    (modulesPath + "/installer/scan/not-detected.nix")
    ./configuration
    ./../modules/autocpufreq.nix
  ];

  boot = {
    kernelModules = [ "kvm-amd" "i2c-dev" "i2c-piix4" ];
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod" "sdhci_pci" ];
      kernelModules = [ "amdgpu" ];
      luks.devices."luks-cf8f735b-5ddc-4f3c-a720-3479f8588f5a".device = "/dev/disk/by-uuid/cf8f735b-5ddc-4f3c-a720-3479f8588f5a";
    };
  };

  fileSystems."/" ={ 
    device = "/dev/disk/by-uuid/5230672f-5d6f-4919-a8f6-bf56d691e302";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/3588-1181";
    fsType = "vfat";
  };

  swapDevices = [ ]; 

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