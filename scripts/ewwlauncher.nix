{ config, lib, pkgs, uservars, tempvar, ... }:

{
  home.file.".scripts/ewwlauncher.sh" = {
    executable = true;
    text = ''
#!/run/current-system/sw/bin/bash

eww daemon
eww open popup-power-window --config ${tempvar}/ewwmy/
eww open bar-test --config ${tempvar}/ewwmy/
blueman-applet &
nm-applet &
eww update soundvol="$(amixer sget Master | grep -o "[0-9]*%" | head -1)" --config ${tempvar}/ewwmy/
bash ${config.home.homeDirectory}/.scripts/eww_ws.sh
    '';
  };
}