{ config
, lib
, pkgs
, gpuvar
, ...
}:
{
  wayland.windowManager.hyprland.settings = {
		windowrule = [
			"move 84.75% 4.25%,^(pavucontrol)$"
      "size 15% 50%,^(pavucontrol)$"
			"move 84.75% 4.25%,^(nm-connection-editor)$"
      "size 15% 50%,^(nm-connection-editor)$"
			"move 81.25% 4.25%, blueman-manager"
      "size 18.5% 55%, blueman-manager"
		];
		source = [
      "${config.home.homeDirectory}/.config/hypr/test.conf"
			"${config.home.homeDirectory}/.config/hypr/monitor.conf"
    ];
  };
	
 home.file.".scripts/screen.sh" = {
   executable = true;
   text = ''
#!/usr/bin/env bash

#-----------------------------------------#
#----------------Variables----------------#

availible_resolutions=("tbqhd" "tbsqhd" "tbfhd" "tbsfhd" "hdmiqhd" "hdmisqhd" "hdmifhd" "hdmisfhd")

declare -A screen1_resolutions
screen1_resolutions["tbqhd"]="monitor=DP-3,3440x1440@144,0x0,1"
screen1_resolutions["tbsqhd"]="monitor=DP-3,3440x1440@144,0x0,1"
screen1_resolutions["tbfhd"]="monitor=DP-3,2560x1080@144,0x0,1"
screen1_resolutions["tbsfhd"]="monitor=DP-3,2560x1080@144,0x0,1"
screen1_resolutions["hdmiqhd"]="monitor=HDMI-A-1,3440x1440@100,1080x0,1"
screen1_resolutions["hdmisqhd"]="monitor=HDMI-A-1,3440x1440@100,0x0,1"
screen1_resolutions["hdmifhd"]="monitor=HDMI-A-1,2560x1080@120,1080x0,1"
screen1_resolutions["hdmisfhd"]="monitor=HDMI-A-1,2560x1080@120,0x0,1"

declare -A screen2_resolutions
screen2_resolutions["tbqhd"]="monitor=DP-4,1920x1080@100,3440x0,1"
screen2_resolutions["tbsqhd"]="monitor=DP-4,disable"
screen2_resolutions["tbfhd"]="monitor=DP-4,1920x1080@100,2560x0,1"
screen2_resolutions["tbsfhd"]="monitor=DP-4,disable"
screen2_resolutions["hdmiqhd"]="monitor=DP-1,1920x1080@100,0x0,1,transform,1"
screen2_resolutions["hdmisqhd"]="monitor=DP-1,disable"
screen2_resolutions["hdmifhd"]="monitor=DP-1,1920x1080@100,0x0,1,transform,1"
screen2_resolutions["hdmisfhd"]="monitor=DP-1,disable"

path="${config.home.homeDirectory}/.config/hypr/monitor.conf"
resolution=$1

#-----------------------------------------#


#-----------------------------------------#
#------------------Main-------------------#

if [ -z "$resolution" ]; then
   resolution="tbqhd"
fi

if [[ ! " ''${availible_resolutions[@]} " =~ " ''${resolution} " ]]; then
   echo "Invalid resolution"
   exit 1
fi

rm -f $path

echo ''${screen1_resolutions[$resolution]} > $path
echo ''${screen2_resolutions[$resolution]} >> $path
echo "monitor=Unknown-1,disabled" >> $path

# to avoid hyprctl reload before hyprland starts as script is executed by systemd
if [ -n "$1" ]; then
		hyprctl reload
fi

#-----------------------------------------#

		'';
	};
}
