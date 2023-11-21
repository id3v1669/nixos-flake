{ config, lib, pkgs, uservars, ... }:

{
  home.file.".scripts/ewwlauncher.sh" = {
    executable = true;
    text = ''
#!/usr/bin/env bash

eww daemon
eww open popup-power-window
eww open calendar-popup-window
eww open bar
blueman-applet &
nm-applet &
eww update soundvol="$(amixer sget Master | grep -o "[0-9]*%" | head -1)"
bash ${config.home.homeDirectory}/.scripts/eww_ws.sh
    '';
  };
}