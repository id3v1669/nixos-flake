{ config
, lib
, pkgs
, gpuvar
, inputs
, ...
}:
{
  wayland.windowManager.hyprland = {
    plugins = [ pkgs.hyprlandPlugins.csgo-vulkan-fix ];
    settings = {
		  windowrule = [
			  "move 84.75% 4.25%,^(org.pulseaudio.pavucontrol)$"
        "size 15% 50%,^(org.pulseaudio.pavucontrol)$"
			  "move 84.75% 4.25%,^(nm-connection-editor)$"
        "size 15% 50%,^(nm-connection-editor)$"
			  "move 81.25% 4.25%, blueman-manager"
        "size 18.5% 55%, blueman-manager"
        "move 81.25% 4.25%, .blueman-manager-wrapped"
        "size 18.5% 55%, .blueman-manager-wrapped"
		  ];
		  source = [
        "${config.home.homeDirectory}/.config/hypr/test.conf"
	  		"${config.home.homeDirectory}/.config/hypr/monitor.conf"
      ];
      workspace = [
        "1, monitor:DP-1"
        "2, monitor:DP-2"
      ];
      exec-once = [
        "xrandr --output DP-1 --primary"
      ];
    };
  };
 home.file.".scripts/screen.sh" = {
   executable = true;
   text = ''
#!/usr/bin/env bash

#-----------------------------------------#
#----------------Variables----------------#

availible_resolutions=("qhd" "sqhd" "sfhd" "sv")

declare -A screen1_resolutions
screen1_resolutions["qhd"]="monitor=DP-1,3440x1440@144,0x0,1"
screen1_resolutions["sqhd"]="monitor=DP-1,3440x1440@144,0x0,1"
screen1_resolutions["sfhd"]="monitor=DP-1,2560x1080@144,0x0,1"
screen1_resolutions["sv"]="monitor=DP-1,disable"

declare -A screen2_resolutions
screen2_resolutions["qhd"]="monitor=DP-2,1920x1080@100,3440x0,1,transform,1"
screen2_resolutions["sqhd"]="monitor=DP-2,disable"
screen2_resolutions["sfhd"]="monitor=DP-2,disable"
screen2_resolutions["sv"]="monitor=DP-2,1920x1080@100,0x0,1,transform,1"

declare -A screen3_resolutions
screen3_resolutions["qhd"]="monitor=HDMI-A-1,1920x1080@60,-1920x0,1"
screen3_resolutions["sqhd"]="monitor=HDMI-A-1,disable"
screen3_resolutions["sfhd"]="monitor=HDMI-A-1,disable"
screen3_resolutions["sv"]="monitor=HDMI-A-1,disable"

path="${config.home.homeDirectory}/.config/hypr/monitor.conf"
resolution=$1

#-----------------------------------------#


#-----------------------------------------#
#------------------Main-------------------#

if [ -z "$resolution" ]; then
   resolution="qhd"
fi

if [[ ! " ''${availible_resolutions[@]} " =~ " ''${resolution} " ]]; then
   echo "Invalid resolution"
   exit 1
fi

rm -f $path

echo ''${screen1_resolutions[$resolution]} > $path
echo ''${screen2_resolutions[$resolution]} >> $path
echo ''${screen3_resolutions[$resolution]} >> $path
echo "monitor=Unknown-1,disabled" >> $path

hyprctl reload

#-----------------------------------------#

		'';
	};
}
