{ config
, pkgs
, ...
}:
{
  home.file.".scripts/ewwlauncher.sh" = {
    executable = true;
    text = ''
#!/usr/bin/env bash

pidof eww | xargs kill
sleep 2
${pkgs.over-eww}/bin/eww daemon
sleep 2
${pkgs.over-eww}/bin/eww open popup-power-window
${pkgs.over-eww}/bin/eww open calendar-popup-window
${pkgs.over-eww}/bin/eww open bar
sleep 2
systemctl --user restart blueman-applet
${pkgs.over-eww}/bin/eww update soundvol="$(amixer sget Master | ${pkgs.gnugrep}/bin/grep -o "[0-9]*%" | head -1)"
bash ${config.home.homeDirectory}/.scripts/eww_ws.sh &
bash ${config.home.homeDirectory}/.scripts/eww_volume.sh &
bash ${config.home.homeDirectory}/.scripts/eww_lang.sh &
bash ${config.home.homeDirectory}/.scripts/eww_songname.sh &
    '';
  };
}