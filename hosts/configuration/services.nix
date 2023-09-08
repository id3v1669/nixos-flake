{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, cpuvar, gpuvar, ...}: 
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
      videoDrivers = [] ++ lib.optionalAttrs (gpuvar == "nvidiaprime") [ "nvidia" ];
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
  };
}