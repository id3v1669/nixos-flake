{ config, lib, pkgs, uservars, ... }:

{
  home.file.".scripts/ewwlauncher.sh" = {
    executable = true;
    text = ''
#!/run/current-system/sw/bin/bash

eww daemon
eww open popup-power-window
eww open calendar-poppup-window
eww open bar
blueman-applet &
nm-applet &
eww update soundvol="$(amixer sget Master | grep -o "[0-9]*%" | head -1)"
bash ${config.home.homeDirectory}/.scripts/eww_ws.sh
    '';
  };
}