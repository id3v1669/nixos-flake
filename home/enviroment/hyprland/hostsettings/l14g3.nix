{ config, lib, pkgs, uservars, ... }:

{
  wayland.windowManager.hyprland.settings = {
		monitor = [
      "eDP-1,1920x1080@60,0x0,1"
      "DP-2,1920x1080@60,0x0,1"
    ];
		windowrule = [
			"move 69% 6%,^(pavucontrol)$"
      "size 30% 65%,^(pavucontrol)$"
			"move 69% 6%,^(nm-connection-editor)$"
      "size 30% 65%,^(nm-connection-editor)$"
			"move 66.15% 6%, blueman-manager"
      "size 37% 71.5%, blueman-manager"
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
