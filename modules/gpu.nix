{lib, config, pkgs, cpuvar, gpuvar, desk, ...}:
{
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = [
        pkgs.libva
      ] ++ lib.lists.optionals (gpuvar.type == "nvidia") (with pkgs; [ 
        libvdpau-va-gl
        nvidia-vaapi-driver
        vaapiVdpau
      ]) ++ lib.lists.optionals (cpuvar == "intel" || gpuvar.type == "intel") (with pkgs; [
        intel-ocl
        vaapiIntel
      ]);
      extraPackages32 = [
        pkgs.pkgsi686Linux.libva
      ] ++ lib.lists.optionals (gpuvar.type == "nvidia") (with pkgs.pkgsi686Linux; [
        libvdpau-va-gl
        vaapiVdpau
      ]) ++ lib.lists.optionals (cpuvar == "intel" || gpuvar == "intel") (with pkgs.pkgsi686Linux; [
        vaapiIntel
      ]);
    };
  } // lib.optionalAttrs (gpuvar.type == "nvidia") {
    nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      forceFullCompositionPipeline = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
      powerManagement.enable = true; 
    } // lib.optionalAttrs (gpuvar.tech == "prime") {
      prime = {
        sync.enable = true;
        nvidiaBusId = "${gpuvar.busd}";
      } // lib.optionalAttrs (cpuvar == "intel") {
        intelBusId = "${gpuvar.busi}";
      } // lib.optionalAttrs (cpuvar == "amd") {
        amdBusId = "${gpuvar.busi}";
      };
    };
  };
}