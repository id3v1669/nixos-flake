{ config, lib, pkgs, uservars, gpuvar, colorsvar, ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
			monitor = [
      ] ++ lib.lists.optionals (gpuvar.port == "hdmiqhd") [
        "HDMI-A-1,3440x1440@100,0x0,1"
			  "DP-5,1920x1080@60,3440x0,1"
		  ] ++ lib.lists.optionals (gpuvar.port == "tbfhd") [
			  "DP-3,2560x1080@120,0x0,1"
			  "DP-4,1920x1080@100,2560x0,1"
		  ] ++ lib.lists.optionals (gpuvar.port == "tbqhd") [
        "DP-3,3440x1440@100,0x0,1"
        "DP-4,1920x1080@100,3440x0,1"
		  ];
			windowrule = [
				"move 84.75% 4.25%,^(pavucontrol)$"
        "size 15% 50%,^(pavucontrol)$"
				"move 84.75% 4.25%,^(nm-connection-editor)$"
        "size 15% 50%,^(nm-connection-editor)$"
				"move 81.25% 4.25%, blueman-manager"
        "size 18.5% 55%, blueman-manager"
			];
		};
  };
  home.sessionVariables = {
		#universal part
    NIXOS_OZONE_WL = "1";
	  MOZ_ENABLE_WAYLAND = "1";
	  SDL_VIDEODRIVER = "wayland";
	  _JAVA_AWT_WM_NONREPARENTING = "1";
	  CLUTTER_BACKEND = "wayland";
	  XDG_CURRENT_DESKTOP = "Hyprland";
	  XDG_SESSION_DESKTOP = "Hyprland";
	  XDG_SESSION_TYPE = "wayland";

		#args for gmaes
		__GL_THREADED_OPTIMIZATIONS="1";
		__GL_SHADER_DISK_CACHE="1";
		__GL_SHADER_DISK_CACHE_SKIP_CLEANUP="1";

		#nvidia part
    WLR_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
  };
}
