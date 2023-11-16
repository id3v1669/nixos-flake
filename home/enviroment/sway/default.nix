{ config, lib, pkgs, deflocale, hostname, ... }:
{
  imports = [
    (./. + "/hosts/${hostname}.nix")
  ];
  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    config = {
      # output = {
      #   "DP-3" = {
      #     mode = "3440x1440@100Hz";
      #     pos = "0 0";
      #     scale = "1";
      #   };
      #   "DP-4" = {
      #     mode = "1920x1080@100Hz";
      #     pos = "3440 0";
      #     scale = "1";
      #   };
      # };
      #bars = [{ command = "${config.home.homeDirectory}/.scripts/ewwlauncher.sh"; }];
      startup = [
        { command = "${config.home.homeDirectory}/.scripts/ewwlauncher.sh"; always = true; }
        { command = "arrpc &"; always = true; }
      ];
      terminal = "alacritty";
      gaps.inner = 5;
      window = {
        border = 2;
        titlebar = false;
      };
      modifier = "Mod4";
      input."type:keyboard" = {
        xkb_layout = "${deflocale.kblayout}";
        xkb_variant = "${deflocale.kbvariant}";
        xkb_options = "${deflocale.kboption}";
        xkb_numlock = "enabled";
      };
      input."type:touchpad" = {
        tap = "enabled";
        natural_scroll = "enabled";
        scroll_method = "two_finger";
      };
      keybindings = let
        mod = config.wayland.windowManager.sway.config.modifier;
      in {
        "${mod}+Shift+t" = "exec alacritty";
        "${mod}+Shift+b" = "exec firefox";
        "${mod}+Shift+k" = "exec kitty";
        "${mod}+Shift+f" = "exec nautilus";
        "${mod}+r" = "exec rofi -show";

        "Ctrl+Right" = "workspace next";
        "Ctrl+Left" = "workspace prev";

        "${mod}+Shift+4" = "exec grim ${config.home.homeDirectory}/Pictures/screenshot-$(date '+%s').png";

        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";

        "${mod}+Shift+q" = "kill";
        "${mod}+g" = "fullscreen toggle"; 

        "Ctrl+Shift+1" = "move container to workspace number 1";
        "Ctrl+Shift+2" = "move container to workspace number 2";
        "Ctrl+Shift+3" = "move container to workspace number 3";
        "Ctrl+Shift+4" = "move container to workspace number 4";
        "Ctrl+Shift+5" = "move container to workspace number 5";
        "Ctrl+Shift+6" = "move container to workspace number 6";
        "Ctrl+Shift+7" = "move container to workspace number 7";
        "Ctrl+Shift+8" = "move container to workspace number 8";
        "Ctrl+Shift+9" = "move container to workspace number 9";
        "Ctrl+Shift+0" = "move container to workspace number 10";
      };
    };
    swaynag = {
      enable = true;
      settings = {
        "<config>" = {
          edge = "bottom";
          font = "Dina 12";
        };
        green = {
          edge = "top";
          background = "00AA00";
          text = "FFFFFF";
          button-background = "00CC00";
          message-padding = 10;
        };
      };
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