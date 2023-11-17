{ config, lib, pkgs, deflocale, gpuvar, ... }:
{
  wayland.windowManager.sway = {
    config = let 
      main = if gpuvar.port == "tbqhd" then "DP-3" else if gpuvar.port == "tbfhd" then "DP-3" else if gpuvar.port == "hdmiqhd" then "HDMI-A-1" else "";
      secondary = if gpuvar.port == "tbqhd" then "DP-4" else if gpuvar.port == "tbfhd" then "DP-4" else if gpuvar.port == "hdmiqhd" then "DP-5" else "";
    in{
      output = {
        "${main}" = {
          mode = if gpuvar.port == "tbqhd" || gpuvar.port == "hdmiqhd" then "3440x1440@100Hz" else if gpuvar.port == "tbfhd" then "2560x1080@120Hz" else "";
          pos = "0 0";
          scale = "1";
        };
        "${secondary}" = {
          mode = "1920x1080@100Hz";
          pos = if gpuvar.port == "tbqhd" || gpuvar.port == "hdmiqhd" then "3440 0" else if gpuvar.port == "tbfhd" then "2560 0" else "";
          scale = "1";
        };
      };
      workspaceOutputAssign = [
        { output = "${main}"; workspace = "1"; }
        { output = "${main}"; workspace = "2"; }
        { output = "${main}"; workspace = "3"; }
        { output = "${main}"; workspace = "4"; }
        { output = "${main}"; workspace = "5"; }
        { output = "${main}"; workspace = "6"; }
        { output = "${main}"; workspace = "7"; }
        { output = "${secondary}"; workspace = "8"; }
        { output = "${secondary}"; workspace = "9"; }
        { output = "${secondary}"; workspace = "10"; }
      ];
    };
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
	  XDG_CURRENT_DESKTOP = "Sway";
	  XDG_SESSION_DESKTOP = "Sway";
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
}