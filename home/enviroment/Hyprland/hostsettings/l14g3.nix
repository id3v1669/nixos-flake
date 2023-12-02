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
}
