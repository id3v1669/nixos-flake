{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, cpuvar, gpuvar, desk, ...}: 
{
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
          command = "Hyprland";
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
