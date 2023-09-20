{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, cpuvar, gpuvar, busvar, ...}: 
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
        pkgs.libva
      ] ++ lib.lists.optionals (gpuvar == "nvidiaprimetb" || gpuvar == "nvidiaprimehdmi") (with pkgs; [ 
        libvdpau-va-gl
        nvidia-vaapi-driver
        vaapiVdpau
      ]) ++ lib.lists.optionals (cpuvar == "intel" || gpuvar == "intel") (with pkgs; [
        intel-ocl
        vaapiIntel
      ]);
      extraPackages32 = [
        pkgs.pkgsi686Linux.libva
      ] ++ lib.lists.optionals (gpuvar == "nvidiaprimetb" || gpuvar == "nvidiaprimehdmi") (with pkgs.pkgsi686Linux; [
        libvdpau-va-gl
        vaapiVdpau
      ]) ++ lib.lists.optionals (cpuvar == "intel" || gpuvar == "intel") (with pkgs.pkgsi686Linux; [
        vaapiIntel
      ]);
    };
  } // lib.optionalAttrs (gpuvar == "nvidiaprimetb" || gpuvar == "nvidiaprimehdmi") {
    nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      forceFullCompositionPipeline = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
      powerManagement.enable = true;
    } // lib.optionalAttrs (gpuvar == "nvidiaprimetb") {
      prime = {
        reverseSync.enable = true;
        offload = {
			    enable = true;
			    enableOffloadCmd = true;
		    };
        nvidiaBusId = "${busvar.nvidia}";
      } // lib.optionalAttrs (cpuvar == "intel") {
        intelBusId = "${busvar.intel}";
      } // lib.optionalAttrs (cpuvar == "amd") {
        amdBusId = "${busvar.amd}";
      };
    };
  };
}
