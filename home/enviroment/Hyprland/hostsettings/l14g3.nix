{ config
, ...
}:
{
  wayland.windowManager.hyprland.settings = {
		windowrule = [
			"move 69% 6%,^(nm-connection-editor)$"
      "size 30% 65%,^(nm-connection-editor)$"
			"move 66.15% 6%, blueman-manager"
      "size 37% 71.5%, blueman-manager"
		];
    source = [
      #"${config.home.homeDirectory}/.config/hypr/test.conf"
			"${config.home.homeDirectory}/.config/hypr/monitor.conf"
    ];
	};
 home.file.".scripts/screen.sh" = {
   executable = true;
   text = ''
#!/usr/bin/env bash

#-----------------------------------------#
#----------------Variables----------------#

availible_resolutions=("single" "triple")

declare -A screen1_resolutions
screen1_resolutions["single"]="monitor=eDP-1,1920x1080@60,0x0,1"
screen1_resolutions["triple"]="monitor=eDP-1,1920x1080@60,4520x0,1"

declare -A screen2_resolutions
screen2_resolutions["single"]="monitor=HDMI-A-1,disable"
screen2_resolutions["triple"]="monitor=HDMI-A-1,3440x1440@120,1080x0,1"

declare -A screen3_resolutions
screen3_resolutions["single"]="monitor=DP-1,disable"
screen3_resolutions["triple"]="monitor=DP-1,1920x1080@100,0x0,1,transform,1"

path="${config.home.homeDirectory}/.config/hypr/monitor.conf"
resolution=$1

#-----------------------------------------#


#-----------------------------------------#
#------------------Main-------------------#

if [ -z "$resolution" ]; then
   resolution="single"
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

if [ "$resolution" == "single" ]; then
   echo "windowrule=move 69% 6%,^(pavucontrol)$" >> $path
   echo "windowrule=size 30% 65%,^(pavucontrol)$" >> $path
fi

# to avoid hyprctl reload before hyprland starts as script is executed by systemd
if [ -n "$1" ]; then
		hyprctl reload
fi

#-----------------------------------------#

		'';
	};
}