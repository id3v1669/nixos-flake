{ config
, lib
, pkgs
, gpuvar
, ...
}:
{
  wayland.windowManager.hyprland.settings = {
		windowrule = [
			"move 84.75% 4.25%,^(org.pulseaudio.pavucontrol)$"
      "size 15% 50%,^(org.pulseaudio.pavucontrol)$"
			"move 84.75% 4.25%,^(nm-connection-editor)$"
      "size 15% 50%,^(nm-connection-editor)$"
			"move 81.25% 4.25%, blueman-manager"
      "size 18.5% 55%, blueman-manager"
		];
		source = [
      "${config.home.homeDirectory}/.config/hypr/test.conf"
			"${config.home.homeDirectory}/.config/hypr/monitor.conf"
    ];
    workspace = [
      "1, monitor:DP-3"
    ];
    exec-once = [
      "xrandr --output DP-3 --primary"
    ];
  };
	
 home.file.".scripts/screen.sh" = {
   executable = true;
   text = ''
#!/usr/bin/env bash

#-----------------------------------------#
#----------------Variables----------------#

availible_resolutions=("qhd" "sqhd" "sfhd" "lock" "unlock")

declare -A screen1_resolutions
screen1_resolutions["qhd"]="monitor=DP-3,3440x1440@144,0x0,1"
screen1_resolutions["sqhd"]="monitor=DP-3,3440x1440@144,0x0,1"
screen1_resolutions["sfhd"]="monitor=DP-3,2560x1080@144,0x0,1"
screen1_resolutions["lock"]="monitor=DP-3,3440x1440@144,0x0,1"

declare -A screen2_resolutions
screen2_resolutions["qhd"]="monitor=DP-2,1920x1080@100,-1080x0,1,transform,1"
screen2_resolutions["sqhd"]="monitor=DP-2,disable"
screen2_resolutions["sfhd"]="monitor=DP-2,disable"
screen2_resolutions["lock"]="monitor=DP-2,disable"

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

#backup for lock to restore session
if [ "$resolution" == "lock" ]; then
  mv $path $path.bak
fi

rm -f $path

if [ "$resolution" == "unlock" ]; then
  mv $path.bak $path
  hyprctl reload
  exit 0
fi

echo ''${screen1_resolutions[$resolution]} > $path
echo ''${screen2_resolutions[$resolution]} >> $path
echo "monitor=Unknown-1,disabled" >> $path

hyprctl reload

#-----------------------------------------#

		'';
	};
}
