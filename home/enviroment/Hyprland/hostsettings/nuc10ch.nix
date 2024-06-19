{ config
, ...
}:
{
  wayland.windowManager.hyprland.settings = {
    source = [
			#"${config.home.homeDirectory}/.config/hypr/monitor.conf"
    ];
	};
}