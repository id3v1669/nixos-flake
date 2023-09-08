{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, cpuvar, gpuvar, desk, ...}: 
{
  services = {
    blueman.enable = true;
    printing.enable = true;
    flatpak.enable = true;
    xserver = {
      enable = true;
      layout = "${deflocale.kblayout}";
      xkbVariant = "${deflocale.kbvariant}";
      xkbOptions = "${deflocale.kboption}";
      videoDrivers = [] ++ lib.optionalAttrs (gpuvar == "nvidiaprime") [ "nvidia" ] ++ lib.optionalAttrs (gpuvar == "amd") [ "amdgpu" ];
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
    xserver = {
      desktopManager.gnome = {
        enable = true;
        debug = false;
      };
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };
  } // lib.optionalAttrs (envir == "hypr") {
    gvfs.enable = true; # Mount, trash, and other functionalities
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
