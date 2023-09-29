{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, cpuvar, gpuvar, ...}: 
# let
#   nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
#     export __NV_PRIME_RENDER_OFFLOAD=1
#     export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
#     export __GLX_VENDOR_LIBRARY_NAME=nvidia
#     export __VK_LAYER_NV_optimus=NVIDIA_only
#     exec -a "$0" "$@"
#   '';
# in
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
      prime = {
        nvidiaBusId = "${gpuvar.busd}";
      } // lib.optionalAttrs (cpuvar == "intel") {
        intelBusId = "${gpuvar.busi}";
      } // lib.optionalAttrs (cpuvar == "amd") {
        amdBusId = "${gpuvar.busi}";
      } // lib.optionalAttrs (gpuvar.mode == "revoffload") {
        reverseSync.enable = true;
        offload = {
			    enable = true;
			    enableOffloadCmd = true;
		    };
      } // lib.optionalAttrs (gpuvar.mode == "offload") {
        offload = {
			    enable = true;
			    enableOffloadCmd = true;
		    };
      } // lib.optionalAttrs (gpuvar.mode == "sync") {
        sync.enable = true;
      };
    };
  };
}
