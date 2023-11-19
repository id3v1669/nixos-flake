{ config, lib, pkgs, uservars, gpuvar, ... }:
{
  wayland.windowManager.hyprland = {
    enableNvidiaPatches = true;
    settings.monitor = [
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
  };
  home.sessionVariables = {
		#universal part
    NIXOS_OZONE_WL = "1";
		QT_QPA_PLATFORMTHEME = "gtk3";
		#QT_STYLE_OVERRIDE = "dynamic-color-theme";
	  QT_SCALE_FACTOR = "1";
	  MOZ_ENABLE_WAYLAND = "1";
	  SDL_VIDEODRIVER = "wayland";
	  _JAVA_AWT_WM_NONREPARENTING = "1";
	  #QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
	  #QT_AUTO_SCREEN_SCALE_FACTOR = "1"; 
	  CLUTTER_BACKEND = "wayland";
	  XDG_CURRENT_DESKTOP = "Hyprland";
	  XDG_SESSION_DESKTOP = "Hyprland";
	  XDG_SESSION_TYPE = "wayland";

		
		#args for gmaes
		__GL_THREADED_OPTIMIZATIONS="1";
		__GL_SHADER_DISK_CACHE="1";
		__GL_SHADER_DISK_CACHE_SKIP_CLEANUP="1";

		#ps.
	  #GTK_USE_PORTAL = "0"; #useless
	  #NIXOS_XDG_OPEN_USE_PORTAL = "1"; #breaks xdg-open

		#nvidia part
		#QT_QPA_PLATFORM = "wayland-egl";#??
    WLR_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
  };
	home.file.".config/hypr/hyprpaper.conf" = {
    text = ''
preload = ${config.home.homeDirectory}/Pictures/Wallpapers/rebecca1.jpg
preload = ${config.home.homeDirectory}/Pictures/Wallpapers/rebecca2.jpg
preload = ${config.home.homeDirectory}/Pictures/Wallpapers/rebecca3.jpg
preload = ${config.home.homeDirectory}/Pictures/Wallpapers/rebecca4.jpg
preload = ${config.home.homeDirectory}/Pictures/Wallpapers/rebecca5.jpg
preload = ${config.home.homeDirectory}/Pictures/Wallpapers/furry1.png
preload = ${config.home.homeDirectory}/Pictures/Wallpapers/furry2.jpg
preload = ${config.home.homeDirectory}/Pictures/Wallpapers/black.jpg
preload = ${config.home.homeDirectory}/Pictures/Wallpapers/gray.jpg
#preload = ${config.home.homeDirectory}/back-test.svg
#preload = ${config.home.homeDirectory}/back-test.ppm

#wallpaper = DP-3,${config.home.homeDirectory}/Pictures/Wallpapers/black.jpg
#wallpaper = DP-4,${config.home.homeDirectory}/Pictures/Wallpapers/black.jpg
wallpaper = DP-3,${config.home.homeDirectory}/Pictures/Wallpapers/rebecca2.jpg
wallpaper = DP-4,${config.home.homeDirectory}/Pictures/Wallpapers/furry1.png
#wallpaper = DP-3,${config.home.homeDirectory}/back-test.svg
#wallpaper = DP-4,${config.home.homeDirectory}/back-test.svg
#wallpaper = DP-3,${config.home.homeDirectory}/back-test.ppm
#wallpaper = DP-4,${config.home.homeDirectory}/back-test.ppm

    '';
  };
}
