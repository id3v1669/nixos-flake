{ config
, lib
, pkgs
, modulesPath
, system
, gpuvar
, ...
}:
let
  over-v4l2loopback = config.boot.kernelPackages.v4l2loopback.overrideAttrs (oldAttrs: rec {
    pname = "v4l2loopback";
    version = "unstable-2024-02-12";

    src = pkgs.fetchFromGitHub {
      owner = "umlaeute";
      repo = "v4l2loopback";
      rev = "5d72c17f92ee0e38efbb7eb85e34443ecbf1a80c";
      hash = "sha256-ggmYH5MUXhMPvA8UZ2EAG+eGoPTNbw7B8UxmmgP6CsE=";
    };
  });
in
{
  imports =[ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    blacklistedKernelModules = [ 
    ] ++ lib.lists.optionals (gpuvar.tech == "nvk") [
      "nvidia"
      "nvidia_uvm"
    ] ++ lib.lists.optionals (gpuvar.tech != "nvk") [
      "nouveau"
    ];
    kernelModules = [ 
      "kvm-intel"
      "i2c-dev"
      "i2c-i801"
    ] ++ lib.lists.optionals (gpuvar.tech == "nvk") [
      "nouveau"
    ];
    kernelParams = [
    ] ++ lib.lists.optionals (gpuvar.tech == "native") [
      "video=HDMI-A-1:3440x1440@100"
      "nvidia_drm.fbdev=1"
    ] ++ lib.lists.optionals (gpuvar.tech == "nvk") [
      "nouveau.config=NvGspRm=1"
      "nouveau.debug=info,VBIOS=info,gsp=debug"
    ];
    kernelPackages = pkgs.linuxPackages_latest;
    kernel.sysctl."kernel.unprivileged_userns_clone" = 1;
    extraModulePackages = with config.boot.kernelPackages; [
      over-v4l2loopback
    ];
    initrd = {
      availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usbhid" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
      kernelModules = [ ];
    };
  };

  fileSystems."/" = {
    device = "";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "";
    fsType = "vfat";
  };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}
