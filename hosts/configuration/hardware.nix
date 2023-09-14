{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, cpuvar, gpuvar, ...}: 
{
  hardware = {
    i2c.enable = true;
    cpu.${cpuvar}.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    pulseaudio.enable = false;
    bluetooth.enable = true;
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = [
      ] ++ lib.lists.optionals (hostname == "nuc11ph") (with pkgs; 
      [ 
        libva
        vaapiIntel
        libvdpau-va-gl
        nvidia-vaapi-driver
        vaapiVdpau
        intel-ocl 
      ]);
      extraPackages32 = [
      ] ++ lib.lists.optionals (hostname == "nuc11ph") (with pkgs.pkgsi686Linux; 
      [
        vaapiIntel
        libvdpau-va-gl
        vaapiVdpau
      ]);
    };
  } // lib.optionalAttrs (gpuvar == "nvidiaprime") {
    nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      forceFullCompositionPipeline = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
      powerManagement.enable = true;
    };
  };
}
