{ lib
, config
, pkgs
, cpuvar
, gpuvar
, ...
}:
{
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = (with pkgs; [
        libva
        vaapiVdpau
        libvdpau-va-gl
      ]) ++ lib.lists.optionals (gpuvar.type == "nvidia" && gpuvar.tech != "nvk") (with pkgs; [
        nvidia-vaapi-driver
      ]) ++ lib.lists.optionals (cpuvar == "intel" || gpuvar.type == "intel") (with pkgs; [
        intel-media-driver
        vaapi-intel-hybrid
        over-intel-vaapi-driver
      ]);
      extraPackages32 = (with pkgs.pkgsi686Linux; [
        vaapiVdpau
        libvdpau-va-gl
      ]) ++ lib.lists.optionals (gpuvar.type == "nvidia" && gpuvar.tech != "nvk") (with pkgs.pkgsi686Linux; [
        nvidia-vaapi-driver
      ]) ++ lib.lists.optionals (cpuvar == "intel" || gpuvar == "intel") (with pkgs.pkgsi686Linux; [
        intel-media-driver
        over-intel-vaapi-driver
      ]);
    };
  } // lib.optionalAttrs (gpuvar.type == "nvidia" && gpuvar.tech != "nvk") {
    nvidia = {
      open = true;
      nvidiaSettings = true;
      modesetting.enable = true;
      forceFullCompositionPipeline = true;
      #package = config.boot.kernelPackages.nvidiaPackages.production;
      # rtx 2060(laptop)-----------------
      # 535.154.05 - works, sync/offload
      # 550.54.14  - works, sync/offload, best performance
      # 550.67     - works, sync/offload
      # 550.76     - works, sync/offload
      # 550.78     - works, sync/offload
      # 555.42.02  - works, finaly works native(hdmi instead of thunderbolt)
      # 545.29.02  - drm(VDPAU) failure
      # 545.29.06  - drm(VDPAU) failure
      # 550.40.07  - drm(VDPAU) failure
      #----------------------------------
      package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version = "555.42.02";
        sha256_64bit = "sha256-k7cI3ZDlKp4mT46jMkLaIrc2YUx1lh1wj/J4SVSHWyk=";
        sha256_aarch64 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
        openSha256 = "sha256-3/eI1VsBzuZ3Y6RZmt3Q5HrzI2saPTqUNs6zPh5zy6w=";
        settingsSha256 = "sha256-rtDxQjClJ+gyrCLvdZlT56YyHQ4sbaL+d5tL4L4VfkA=";
        persistencedSha256 = "sha256-3ae31/egyMKpqtGEqgtikWcwMwfcqMv2K4MVFa70Bqs=";
        patchFlags = ["-p1" "-d" "kernel"];
        patches = [];
      };
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
  services.xserver.videoDrivers = [
  ] ++ lib.lists.optionals (gpuvar.type == "intel")[ "intel"
  ] ++ lib.lists.optionals (gpuvar.type == "nvidia" && gpuvar.tech != "nvk")[ "nvidia"
  ] ++ lib.lists.optionals (gpuvar.type == "amd" || cpuvar == "amd" ) [ "amdgpu" "radeon" ];
  environment.variables = {
  } // lib.optionalAttrs ( gpuvar.tech == "native") {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NVD_BACKEND = "direct";
    WLR_NO_HARDWARE_CURSORS = "1";
  } // lib.optionalAttrs (gpuvar.tech == "nvk") {
    NVK_I_WANT_A_BROKEN_VULKAN_DRIVER = "1";             # prep for nvk
    MESA_VK_VERSION_OVERRIDE = "1.3";                    # prep for nvk
  };
}
