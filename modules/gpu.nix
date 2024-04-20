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
      # 535.154.05 - works
      # 550.54.14  - works, best performance
      # 550.67     - works
      # 550.76     - works
      # 545.29.02  - drm(VDPAU) failure
      # 545.29.06  - drm(VDPAU) failure
      # 550.40.07  - drm(VDPAU) failure
      #----------------------------------
      package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version = "550.76";
        sha256_64bit = "sha256-2/wAmBNiePhX74FsV7j21LnCaubxMC/kAYMmf8kQt1s=";
        sha256_aarch64 = "sha256-Y2RDOuDtiIclr06gmLrPDfE5VdmFamXxiIIKtKAewro=";
        openSha256 = "sha256-RWaUXIr/yCRmX4yIyUxvBxrKCLKRKSi4lQJAYvrd2Kg=";     
        settingsSha256 = "sha256-Lv95+0ahvU1+X/twzWWVqQH4nqq491ALigH9TVBn+YY=";
        persistencedSha256 = "sha256-rbgI9kGdVzGlPNEvaoOq2zrAMx+H8D+XEBah2eqZzuI=";
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
}
