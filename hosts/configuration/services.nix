{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, cpuvar, gpuvar, desk, ...}: 
{
  #temp id3v1669
#env = LIBVA_DRIVER_NAME,nvidia
#env = XDG_SESSION_TYPE,wayland
#env = GBM_BACKEND,nvidia-drm
#env = __GLX_VENDOR_LIBRARY_NAME,nvidia
#env = WLR_NO_HARDWARE_CURSORS,1
  environment.sessionVariables = {
    EDITOR = "nano";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  } // lib.optionalAttrs (envir == "hypr") {
    #__GL_VRR_ALLOWED = "1";
    #WLR_RENDERER_ALLOW_SOFTWARE = "1";
    #CLUTTER_BACKEND = "wayland";
    #WLR_RENDERER = "vulkan";
    #DisplayServer="wayland"; #try for sddm
    NIXOS_OZONE_WL = "1"; # needer for electron appps
    GDK_BACKEND = "wayland"; #,x11"; #edited 

    #XDG_CURRENT_DESKTOP = "Hyprland";
    #XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    #QT_QPA_PLATFORM="wayland";
    #QT_QPA_PLATFORMTHEME="wayland;xcb";
    #MOZ_ENABLE_WAYLAND = "1";
    #MOZ_WEBRENDER = "1";
   } // lib.optionalAttrs (envir == "hypr" && gpuvar == "nvidiaprime") {
    LIBVA_DRIVER_NAME = "nvidia";
    #GBM_BACKEND = "nvidia-drm";
    #__GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
    #WLR_EGL_NO_MODIFIRES = "1"; ??
   };
  services = {
    blueman.enable = true;
    printing.enable = true;
    flatpak.enable = true;
    hardware.openrgb = {
      enable = true;
      motherboard = "${cpuvar}";
    };
    xserver = {
      enable = true;
      layout = "${deflocale.kblayout}";
      xkbVariant = "${deflocale.kbvariant}";
      xkbOptions = "${deflocale.kboption}";
      videoDrivers = [] ++ lib.lists.optionals (gpuvar == "nvidiaprime") [ "nvidia" ] ++ lib.lists.optionals (gpuvar == "amd") [ "amdgpu" ];
    } // lib.optionalAttrs (envir == "gnome") {
      desktopManager.gnome = {
        enable = true;
        debug = false;
      };
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    # } // lib.optionalAttrs (envir == "hypr") {
    #   displayManager = {
    #     defaultSession = "Hyprland";
    #     gdm = {
    #       enable = false;
    #       wayland = true;
    #       #settings = {
    #       #  daemon = {
    #       #    User = "user";
    #       #    Group = "gdm";
    #       #  };
    #       #};
    #     };
    #     sddm.enable = false;
    #     lightdm.enable = false; #{
    #     #  enable = true;
    #     #  greeter.enable = true;
    #       #greeters.gtk = {
    #       #  enable = true;
    #         #theme = {
    #         #  package = pkgs.gnome.gnome-themes-extra;
    #         #  name = "Adwaita";
    #         #};
    #       #};
    #     #};
    #     #sddm = {
    #     #  enable = true;
    #     #  enableHidpi = false;
    #     #  theme = "sddm-chili-theme";
    #     #};
    #     session = [
    #       {
    #         manage = "desktop";
    #         name = "Hyprland";
    #         start = ''
    #           exec Hyprland &
    #           waitPID=$!
    #         '';
    #       }
    #       {
    #         manage = "desktop";
    #         name = "Hyprland2";
    #         start = ''
    #           exec Hyprland &
    #           waitPID=$!
    #         '';
    #       }
    #     ];
    #   };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
      jack.enable = true;
    };
  } // lib.optionalAttrs (envir == "gnome") {
    power-profiles-daemon.enable = false;
  } // lib.optionalAttrs (envir == "hypr") {
    gvfs.enable = true; # Mount, trash, etc
    mpd.enable = true;
    greetd = {
      enable = true;
      settings = {
        initial_session = {
          user = "${uservars.name}";
          command = "$SHELL -l";
        };
      };
    };
  } // lib.optionalAttrs (desk == "laptop") {
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          scaling_min_freq = 600000;
          scaling_max_freq = 1300000;
          turbo = "never";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };
  };
}
