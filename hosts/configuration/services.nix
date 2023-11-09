{lib, config, pkgs, fetchFromGitLab, curversion, deflocale, uservars, hostname, envir, cpuvar, gpuvar, desk, ...}: 
{
  services = {
    xserver = {
      enable = true;
      layout = "${deflocale.kblayout}";
      xkbVariant = "${deflocale.kbvariant}";
      xkbOptions = "${deflocale.kboption}";
      videoDrivers = [ 
      ] ++ lib.lists.optionals (gpuvar.type == "intel")[
        "i915"
      ] ++ lib.lists.optionals (gpuvar.type == "nvidia")[
        "nvidia"
      ] ++ lib.lists.optionals (gpuvar.type == "amd" || cpuvar == "amd" ) [
        "amdgpu"
      ] ;
  } // lib.optionalAttrs (envir == "gnome") {
      desktopManager.gnome = {
        enable = true;
        debug = false;
      };
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };    
  } // lib.optionalAttrs (desk == "desktop" || desk == "laptop") {
    blueman.enable = true;
    printing.enable = true;
    flatpak.enable = true;
    hardware = {
      #openrgb = { ## broken.    rules and kernel modules install manually
      #  enable = true;
      #  motherboard = "${cpuvar}";
      #  package = pkgs.openrgb-with-all-plugins;
      #};
      bolt.enable = true;
    };
    pipewire = {
      enable = true;
      package = pkgs.pipewire;
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
    mpd.enable = true; # music player daemon
    greetd = {
     enable = true;
     settings = {
       initial_session = {
         user = "${uservars.name}";
         command = "Hyprland";
       };
     };
    };
  };
}
