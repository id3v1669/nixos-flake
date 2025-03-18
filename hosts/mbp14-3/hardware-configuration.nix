{
  config,
  lib,
  pkgs,
  modulesPath,
  system,
  inputs,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    #inputs.nixos-hardware.nixosModules.apple-t2
  ];

  boot = {
    kernelModules = ["kvm-intel"];
    kernelParams = [
      "i915.enable_fbc=1"
      "i915.enable_psr=2"
      "intel_iommu=on"
      "iommu=pt"
      "pcie_ports=compat"
    ];
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
    initrd = {
      availableKernelModules = ["nvme" "xhci_pci" "sd_mod" "uas"];
      kernelModules = ["amdgpu" "i915" "applespi" "spi_pxa2xx_platform" "intel_lpss_pci" "applesmc"];
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/64e48775-e27b-4450-bf4b-0f3e1205b5c7";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/C680-AD9B";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  environment.etc."libinput/local-overrides.quirks".text = ''
    [MacBook(Pro) SPI Touchpads]
    MatchName=*Apple SPI Touchpad*
    ModelAppleTouchpad=1
    AttrTouchSizeRange=200:150
    AttrPalmSizeThreshold=1100

    [MacBook(Pro) SPI Keyboards]
    MatchName=*Apple SPI Keyboard*
    AttrKeyboardIntegration=internal

    [MacBookPro Touchbar]
    MatchBus=usb
    MatchVendor=0x05AC
    MatchProduct=0x8600
    AttrKeyboardIntegration=internal
  '';

  services = {
    fstrim.enable = true;
    libinput.enable = true;
  };

  hardware.enableRedistributableFirmware = true;
  hardware.apple-t2.enableAppleSetOsLoader = true;
  swapDevices = [];

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}
