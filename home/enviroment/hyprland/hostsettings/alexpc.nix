{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings.monitor = [
    "DP-1,3440x1440@165,2560x0,1"
    "DP-2,2560x1440@144,0x0,1"
  ];
  home.sessionVariables = {
		#universal part
    NIXOS_OZONE_WL = "1";
	  QT_QPA_PLATFORMTHEME = "gtk3";
	  QT_SCALE_FACTOR = "1";
	  MOZ_ENABLE_WAYLAND = "1";
	  SDL_VIDEODRIVER = "wayland";
	  _JAVA_AWT_WM_NONREPARENTING = "1";
	  QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
	  QT_AUTO_SCREEN_SCALE_FACTOR = "1"; 
	  CLUTTER_BACKEND = "wayland";
	  XDG_CURRENT_DESKTOP = "Hyprland";
	  XDG_SESSION_DESKTOP = "Hyprland";
	  XDG_SESSION_TYPE = "wayland";
	  GTK_USE_PORTAL = "1";
	  NIXOS_XDG_OPEN_USE_PORTAL = "1";
	  XDG_CACHE_HOME = "/home/${uservars.name}/.cache";
	  XDG_CONFIG_HOME = "/home/${uservars.name}/.config";
	  XDG_BIN_HOME = "/home/${uservars.name}/.local/bin";
	  XDG_DATA_HOME = "/home/${uservars.name}/.local/share";
  };
}