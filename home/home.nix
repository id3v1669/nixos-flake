{ hyprland, inputs, config, lib, pkgs, curversion, uservars, envir, hostname, colorsvar, gpuvar, desk, ... }:
{
  imports = [
    ./programs
    ./pkgs
  ] ++ lib.lists.optionals (desk == "desktop" || desk == "laptop") [
    ./assets
    ./../scripts
    ./enviroment/qt
    ./enviroment/dconf
    ./enviroment/gtk
    ./enviroment/rofi
    ./enviroment/eww
    ./enviroment/dunst
    ./enviroment/xdg
    ./enviroment/swhkd
    ./enviroment/swayidle
    ./enviroment/swaylock
    ./enviroment/${envir}
    inputs.nix-colors.homeManagerModules.default
  ];
  home = {
    stateVersion = "${curversion}";
    username = "${uservars.name}";
    homeDirectory = "/home/${uservars.name}";
    sessionVariables = {
		  #wayland vars
      NIXOS_OZONE_WL = "1";
	    MOZ_ENABLE_WAYLAND = "1";
	    _JAVA_AWT_WM_NONREPARENTING = "1";
      SDL_VIDEODRIVER = "wayland";
	    CLUTTER_BACKEND = "wayland";
      QT_QPA_PLATFORM="wayland";
	    XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "${envir}";
	    XDG_SESSION_DESKTOP = "${envir}";
      LIBVA_DRIVER_NAME="iHD";

		  #args for gmaes
		  __GL_THREADED_OPTIMIZATIONS="1";
		  __GL_SHADER_DISK_CACHE="1";
		  __GL_SHADER_DISK_CACHE_SKIP_CLEANUP="1";
	  };
  };
} // lib.optionalAttrs (desk != "server") {
  colorScheme = inputs.nix-colors.colorSchemes.${colorsvar};
}
