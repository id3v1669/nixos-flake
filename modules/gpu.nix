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
      ]) ++ lib.lists.optionals ((cpuvar.type == "intel" && cpuvar.hasIntegrated) || gpuvar.type == "intel") (with pkgs; [
        intel-media-driver
        vaapi-intel-hybrid
        intel-vaapi-driver
      ]);
      extraPackages32 = (with pkgs.pkgsi686Linux; [
        vaapiVdpau
        libvdpau-va-gl
      ]) ++ lib.lists.optionals (gpuvar.type == "nvidia" && gpuvar.tech != "nvk") (with pkgs.pkgsi686Linux; [
        nvidia-vaapi-driver
      ]) ++ lib.lists.optionals ((cpuvar.type == "intel" && cpuvar.hasIntegrated) || gpuvar == "intel") (with pkgs.pkgsi686Linux; [
        intel-media-driver
        vaapi-intel-hybrid
        intel-vaapi-driver
      ]);
    };
  } // lib.optionalAttrs (gpuvar.type == "nvidia" && gpuvar.tech != "nvk") {
    nvidia = {
      open = true;
      nvidiaSettings = false;
      modesetting.enable = true;
      powerManagement.enable = true;
      forceFullCompositionPipeline = true;
      package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version = "565.77";
        sha256_64bit = "sha256-CnqnQsRrzzTXZpgkAtF7PbH9s7wbiTRNcM0SPByzFHw=";
        openSha256 = "sha256-Fxo0t61KQDs71YA8u7arY+503wkAc1foaa51vi2Pl5I=";
        settingsSha256 = lib.fakeSha256;
        sha256_aarch64 = lib.fakeSha256;
        persistencedSha256 = lib.fakeSha256;
        patchesOpen = [ ];
      };
    } // lib.optionalAttrs (gpuvar.tech == "prime") {
      prime = {
        sync.enable = true;
        nvidiaBusId = "${gpuvar.busd}";
      } // lib.optionalAttrs (cpuvar.type == "intel") {
        intelBusId = "${gpuvar.busi}";
      } // lib.optionalAttrs (cpuvar.type == "amd") {
        amdBusId = "${gpuvar.busi}";
      };
    };
  };
  services.xserver.videoDrivers = [
  ] ++ lib.lists.optionals (gpuvar.type == "intel")[ "intel"
  ] ++ lib.lists.optionals (gpuvar.type == "nvidia" && gpuvar.tech != "nvk")[ "nvidia"
  ] ++ lib.lists.optionals (gpuvar.type == "amd" || (cpuvar.type == "amd" && cpuvar.hasIntegrated) ) [ "amdgpu" "radeon" ];
  environment = {
    systemPackages = [] ++ lib.lists.optionals (gpuvar.type == "nvidia" && gpuvar.tech != "nvk") (with pkgs; [
      (egl-wayland.overrideAttrs (oldAttrs: {
        version = "1.1.17";
        src = pkgs.fetchFromGitHub {
          owner = "NVIDIA";
          repo = "egl-wayland";
          rev = "eeb29e10e5e7bedb0ce81cfff34683eda960bc80";
          hash = "sha256-/lj52qCbv07NDYDdF8SEjCIWWPAMcwXNvYXiU8IoC/A=";
        };
      }))
      nvidia-system-monitor-qt
    ]);
    variables = {
    } // lib.optionalAttrs ( gpuvar.type == "nvidia" && gpuvar.tech == "native") {
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
