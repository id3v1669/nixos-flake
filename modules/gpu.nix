{ lib
, config
, pkgs
, cpuvar
, gpuvar
, uservars
, ...
}:
{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = (with pkgs; [
        libva
        vaapiVdpau
        libvdpau-va-gl
      ]) ++ lib.lists.optionals (gpuvar.type == "nvidia" && gpuvar.tech != "nvk") (with pkgs; [
        nvidia-vaapi-driver
      ]) ++ lib.lists.optionals (cpuvar == "intel" || gpuvar.type == "intel") (with pkgs; [
        intel-media-driver
        vaapi-intel-hybrid
        intel-vaapi-driver
      ]);
      extraPackages32 = (with pkgs.pkgsi686Linux; [
        vaapiVdpau
        libvdpau-va-gl
      ]) ++ lib.lists.optionals (gpuvar.type == "nvidia" && gpuvar.tech != "nvk") (with pkgs.pkgsi686Linux; [
        nvidia-vaapi-driver
      ]) ++ lib.lists.optionals (cpuvar == "intel" || gpuvar == "intel") (with pkgs.pkgsi686Linux; [
        intel-media-driver
        vaapi-intel-hybrid
        intel-vaapi-driver
      ]);
    };
  } // lib.optionalAttrs (gpuvar.type == "nvidia" && gpuvar.tech != "nvk") {
    nvidia = {
      open = true;
      nvidiaSettings = true;
      modesetting.enable = true;
      powerManagement.enable = true;
      forceFullCompositionPipeline = true;
      # rtx 2060(laptop)-----------------
      # 535.154.05 - works, sync/offload
      # 550.54.14  - works, sync/offload, best performance
      # 550.67     - works, sync/offload
      # 550.76     - works, sync/offload
      # 550.78     - works, sync/offload
      # 555.42.02  - works, hdmi,         finaly works native(hdmi instead of thunderbolt)
      # 555.52.04  - works, hdmi,         
      # 560.28.03  - works, hdmi,         better performance, more glitchi on open-kernel-module
      # 545.29.02  - drm(VDPAU) failure
      # 545.29.06  - drm(VDPAU) failure
      # 550.40.07  - drm(VDPAU) failure
      #----------------------------------
      # rtx 3080-------------------------
      # 555.52.04  - works, hdmi,         
      # 560.28.03  - works, hdmi,         
      # 560.31.02  - works, hdmi,         
      # 560.35.03  - works, hdmi,         best performance, finaly fixed electron
      #----------------------------------
      package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version = "560.35.03";
        sha256_64bit = "sha256-8pMskvrdQ8WyNBvkU/xPc/CtcYXCa7ekP73oGuKfH+M=";
        openSha256 = "sha256-/32Zf0dKrofTmPZ3Ratw4vDM7B+OgpC4p7s+RHUjCrg=";
        settingsSha256 = "sha256-kQsvDgnxis9ANFmwIwB7HX5MkIAcpEEAHc8IBOLdXvk=";
        sha256_aarch64 = lib.fakeSha256;
        persistencedSha256 = lib.fakeSha256;
      };
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
  environment = {
    systemPackages = [] ++ lib.lists.optionals (gpuvar.type == "nvidia" && gpuvar.tech != "nvk") (with pkgs; [
      (egl-wayland.overrideAttrs (oldAttrs: {
        version = "1.1.17";
        src = pkgs.fetchFromGitHub {
          owner = "NVIDIA";
          repo = "egl-wayland";
          rev = "2d5ecff47ae8050a2b31c4ec12dbfec959c4e40d";
          hash = "sha256-Y5GnM+HU77ZkzBrm8dYJU5946sbvqVnekPHGNQ7s5yg=";
        };
      }))
      nvidia-system-monitor-qt
    ]);
    variables = {
    } // lib.optionalAttrs ( gpuvar.tech == "native") {
      LIBVA_DRIVER_NAME = "nvidia";
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      NVD_BACKEND = "direct";
      __GL_GSYNC_ALLOWED = "1";
      __GL_VRR_ALLOWED = "1";
    };
  };
  users.users.${uservars.name}.extraGroups = [ "video" ];
}
