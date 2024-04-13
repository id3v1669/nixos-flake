{ config
, ...
}:
{
  home.file.".scripts/ewwlauncher.sh" = {
    executable = true;
    text = ''
#!/usr/bin/env bash

pidof eww | xargs kill
sleep 2
eww daemon
sleep 2
eww open popup-power-window
eww open calendar-popup-window
eww open bar
blueman-applet &
nm-applet &
eww update soundvol="$(amixer sget Master | grep -o "[0-9]*%" | head -1)"
bash ${config.home.homeDirectory}/.scripts/eww_ws.sh &
bash ${config.home.homeDirectory}/.scripts/volume.sh &
bash ${config.home.homeDirectory}/.scripts/lang.sh &
bash ${config.home.homeDirectory}/.scripts/songname.sh &
    '';
  };
}