{
  lib,
  config,
  pkgs,
  cpuvar,
  gpuvar,
  uservars,
  ...
}: {
  hardware =
    {
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages =
          (with pkgs; [
            libva
            vaapiVdpau
            libvdpau-va-gl
          ])
          ++ lib.lists.optionals (gpuvar.type == "nvidia" && gpuvar.tech != "nvk") (with pkgs; [
            nvidia-vaapi-driver
          ])
          ++ lib.lists.optionals ((cpuvar.type == "intel" && cpuvar.hasIntegrated) || gpuvar.type == "intel") (with pkgs; [
            intel-media-driver
            vaapi-intel-hybrid
            intel-vaapi-driver
          ])
          ++ lib.lists.optionals (gpuvar.type == "amd" || (cpuvar.type == "amd" && cpuvar.hasIntegrated)) (with pkgs; [
            #amdvlk
          ]);
        extraPackages32 =
          (with pkgs.pkgsi686Linux; [
            vaapiVdpau
            libvdpau-va-gl
          ])
          ++ lib.lists.optionals (gpuvar.type == "nvidia" && gpuvar.tech != "nvk") (with pkgs.pkgsi686Linux; [
            nvidia-vaapi-driver
          ])
          ++ lib.lists.optionals ((cpuvar.type == "intel" && cpuvar.hasIntegrated) || gpuvar == "intel") (with pkgs.pkgsi686Linux; [
            intel-media-driver
            vaapi-intel-hybrid
            intel-vaapi-driver
          ])
          ++ lib.lists.optionals (gpuvar.type == "amd" || (cpuvar.type == "amd" && cpuvar.hasIntegrated)) (with pkgs; [
            #driversi686Linux.amdvlk
          ]);
      };
    }
    // lib.optionalAttrs (gpuvar.type == "nvidia" && gpuvar.tech != "nvk") {
      nvidia =
        {
          open = true;
          nvidiaSettings = false;
          modesetting.enable = true;
          powerManagement.enable = true;
          forceFullCompositionPipeline = true;
          package = config.boot.kernelPackages.nvidiaPackages.latest;
        }
        // lib.optionalAttrs (gpuvar.tech == "prime") {
          prime =
            {
              sync.enable = true;
              nvidiaBusId = "${gpuvar.busd}";
            }
            // lib.optionalAttrs (cpuvar.type == "intel") {
              intelBusId = "${gpuvar.busi}";
            }
            // lib.optionalAttrs (cpuvar.type == "amd") {
              amdBusId = "${gpuvar.busi}";
            };
        };
    };
  services.xserver.videoDrivers =
    lib.lists.optionals (gpuvar.type == "intel") [
      "intel"
    ]
    ++ lib.lists.optionals (gpuvar.type == "nvidia" && gpuvar.tech != "nvk") [
      "nvidia"
    ]
    ++ lib.lists.optionals (gpuvar.type == "amd" || (cpuvar.type == "amd" && cpuvar.hasIntegrated)) ["amdgpu" "radeon"];
  environment = {
    systemPackages = lib.lists.optionals (gpuvar.type == "nvidia" && gpuvar.tech != "nvk") (with pkgs; [
      egl-wayland
      nvidia-system-monitor-qt
    ]);
    variables =
      {
      }
      // lib.optionalAttrs (gpuvar.type == "nvidia" && gpuvar.tech == "native") {
        LIBVA_DRIVER_NAME = "nvidia";
        GBM_BACKEND = "nvidia-drm";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        NVD_BACKEND = "direct";
        __GL_GSYNC_ALLOWED = "1";
        __GL_VRR_ALLOWED = "1";
      };
  };
  users.users.${uservars.name}.extraGroups = ["video"];
}
