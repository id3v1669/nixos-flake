{
  config,
  lib,
  pkgs,
  modulesPath,
  system,
  inputs,
  ...
}: let
  appleibridge = config.boot.kernelPackages.callPackage (
    {
      stdenv,
      fetchFromGitHub,
      kernel,
      ...
    }:
      stdenv.mkDerivation {
        name = "appleibridge";
        version = "0.1.0";

        src = fetchFromGitHub {
          owner = "id3v1669";
          repo = "macbook14-3-driver";
          rev = "3c59cf4748cb097a2d0ec178262a88dbc6b4beb8";
          sha256 = "sha256-Y9NdvyJ36fFM1VTUUvjeWCjACDIRPVzdsRPYw7gXAl8=";
        };

        nativeBuildInputs = kernel.moduleBuildDependencies;

        hardeningDisable = ["pic" "format"];

        makeFlags = [
          "KVER=${kernel.modDirVersion}"
          "KERNELRELEASE=${kernel.modDirVersion}"
          "KDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
          "INSTALL_MOD_PATH=$(out)"
        ];

        installPhase = ''
          install -D *.ko -t "$out/lib/modules/${kernel.modDirVersion}/kernel/drivers/misc/"
        '';
      }
  ) {};
in {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelModules = ["kvm-intel"];
    kernelParams = [
      "module_blacklist=i915"
      "intel_iommu=on"
      "iommu=pt"
      "pcie_ports=compat"
    ];
    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
      appleibridge
    ];
    extraModprobeConfig = ''
      options apple_ib_tb fnmode=1
      options applespi fnremap=1
      options apple-gmux force_igd=n
    '';
    initrd = {
      availableKernelModules = ["nvme" "xhci_pci" "sd_mod" "uas" "usbhid"];
      kernelModules = [
        "amdgpu"
        "apple-ib-tb"
        "applespi"
      ];
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/12503cab-79f3-438c-912c-110ae44d2b1f";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/282F-29D7";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/8c71f157-80b6-41b8-808b-0b207cfda8f4";}
  ];

  services.udev = {
    extraHwdb = ''
      evdev:name:Apple SPI Touchpad:dmi:*:svnAppleInc.:pnMacBookPro14,3:*
       EVDEV_ABS_00=::96
       EVDEV_ABS_01=::95
       EVDEV_ABS_35=::96
       EVDEV_ABS_36=::95

      libinput:name:*Apple SPI Touchpad*:dmi:*
       LIBINPUT_MODEL_APPLE_TOUCHPAD=1
       LIBINPUT_ATTR_KEYBOARD_INTEGRATION=internal
       LIBINPUT_ATTR_TOUCH_SIZE_RANGE=200:150
       LIBINPUT_ATTR_PALM_SIZE_THRESHOLD=1200
    '';
  };

  hardware = {
    facetimehd.enable = true;
    enableRedistributableFirmware = true;
  };

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}
