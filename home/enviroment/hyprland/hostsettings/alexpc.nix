{ config, lib, pkgs, uservars, ... }:

{
  wayland.windowManager.hyprland.settings = {
		monitor = [
      "DP-1,3440x1440@165,2560x0,1"
      "DP-2,2560x1440@144,0x0,1"
    ];
		exec-once = [
    ];
	};
  home.sessionVariables = {
		#universal part
    NIXOS_OZONE_WL = "1";
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
  };
}