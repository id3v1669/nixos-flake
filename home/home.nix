{ lib
, curversion
, uservars
, envir
, colorsvar
, desk
, nix-colors
, gpuvar
, ...
}:
{
  imports = [
    ./programs
    ./pkgs
  ] ++ lib.lists.optionals (envir != "none") [
    ./assets
    ./../scripts
    ./enviroment/qt
    ./enviroment/dconf
    ./enviroment/gtk
    ./enviroment/rofi
    ./enviroment/xdg
    ./enviroment/swhkd
    ./enviroment/${envir}
    nix-colors.homeManagerModules.default
  ] ++ lib.lists.optionals (envir != "plasma5" && envir != "none") [
    ./enviroment/eww
    ./enviroment/dunst
    ./enviroment/swayidle
    ./enviroment/swaylock
  ];
  home = {
    stateVersion = "${curversion}";
    username = "${uservars.name}";
    homeDirectory = "/home/${uservars.name}";
    sessionVariables = {
      WLR_RENDERER="vulkan";
      NIXOS_OZONE_WL = "1";
	    MOZ_ENABLE_WAYLAND = "1";
	    _JAVA_AWT_WM_NONREPARENTING = "1";
      SDL_VIDEODRIVER = "wayland";
	    CLUTTER_BACKEND = "wayland";
      GDK_BACKEND="wayland";
      QT_QPA_PLATFORM="wayland";
	    XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "${envir}";
	    XDG_SESSION_DESKTOP = "${envir}";
	  } // lib.optionalAttrs (gpuvar.tech == "native") {
      LIBVA_DRIVER_NAME = "nvidia";
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      #WLR_NO_HARDWARE_CURSORS = "1";
    };
  };
} // lib.optionalAttrs (desk != "server") {
  colorScheme = nix-colors.colorSchemes.${colorsvar};
}
