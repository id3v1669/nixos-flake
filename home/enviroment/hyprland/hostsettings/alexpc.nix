{ config, lib, pkgs, uservars, ... }:

{
  wayland.windowManager.hyprland.settings = {
		monitor = [
      "DP-1,3440x1440@165,2560x0,1"
      "DP-2,2560x1440@144,0x0,1"
    ];
	};
}