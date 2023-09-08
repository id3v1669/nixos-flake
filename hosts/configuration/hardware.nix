{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, cpuvar, ...}: 
{
  hardware = {
    cpu.${cpuvar}.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    pulseaudio.enable = false;
    bluetooth.enable = true;
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = [] ++ lib.lists.optionals (hostname == "nuc11ph") (with pkgs; [
        intel-media-driver
        vaapiIntel
        nvidia-vaapi-driver
        vaapiVdpau
        libvdpau-va-gl
      ]);
    };
  } // lib.optionalAttrs (hostname == "nuc11ph") {
    nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
      prime = {
        intelBusId = "PCI:00:02:0";
        nvidiaBusId = "PCI:01:00:0";
        reverseSync.enable = true;
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
      };
      powerManagement = {
        enable = true;
        finegrained = true;
      };
    };
  };
}