{ config
, lib
, modulesPath
, system
, ...
}:
{
  imports = [
    (modulesPath + "/hardware/network/broadcom-43xx.nix")
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    blacklistedKernelModules = [
      "b43"
      "b43legacy"
      "ssb"
      "bcm43xx"
      "brcm80211"
      "brcmfmac"
      "brcmsmac"
      "bcma"
    ];
    kernelModules = [ "kvm-intel" "i2c-dev" "i2c-i801" ];
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback broadcom-sta ];
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "sd_mod" ];
      kernelModules = [ "amdgpu" "applespi" "intel_lpss_pci" "spi_pxa2xx_platform" "apple-ib-tb" ];
    };
  };

  fileSystems."/" ={ 
    device = "/dev/disk/by-uuid/c435a136-0f47-4853-ac11-140b6c865a00";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/0024-D8A4";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  swapDevices = [ ]; 

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}