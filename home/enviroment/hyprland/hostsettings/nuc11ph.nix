{ config, lib, pkgs, uservars, gpuvar, colorsvar, ... }:
{
  wayland.windowManager.hyprland = {
    enableNvidiaPatches = true;
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
			exec-once = [
        "hyprpaper &"
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

		#ps.
	  #NIXOS_XDG_OPEN_USE_PORTAL = "1"; #breaks xdg-open

		#nvidia part
    WLR_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
  };
	home.file.".config/hypr/hyprpaper.conf".text = ''
preload = ${config.home.homeDirectory}/Pictures/Wallpapers/${colorsvar}/${uservars.wp1}
preload = ${config.home.homeDirectory}/Pictures/Wallpapers/${colorsvar}/${uservars.wp2}
#preload = ${config.home.homeDirectory}/Pictures/Wallpapers/rebecca3.jpg
#preload = ${config.home.homeDirectory}/Pictures/Wallpapers/rebecca4.jpg
#preload = ${config.home.homeDirectory}/Pictures/Wallpapers/rebecca5.jpg
#preload = ${config.home.homeDirectory}/Pictures/Wallpapers/furry1.png
#preload = ${config.home.homeDirectory}/Pictures/Wallpapers/furry2.jpg
#preload = ${config.home.homeDirectory}/Pictures/Wallpapers/black.jpg
#preload = ${config.home.homeDirectory}/Pictures/Wallpapers/gray.jpg

#wallpaper = DP-3,${config.home.homeDirectory}/Pictures/Wallpapers/black.jpg
#wallpaper = DP-4,${config.home.homeDirectory}/Pictures/Wallpapers/black.jpg
wallpaper = DP-3,${config.home.homeDirectory}/Pictures/Wallpapers/${colorsvar}/rebecca2.jpg
wallpaper = DP-4,${config.home.homeDirectory}/Pictures/Wallpapers/${colorsvar}/furry1.png
#wallpaper = DP-3,${config.home.homeDirectory}/Pictures/Wallpapers/${colorsvar}/${uservars.wp1}
#wallpaper = DP-4,${config.home.homeDirectory}/Pictures/Wallpapers/${colorsvar}/${uservars.wp2}

  '';
}
