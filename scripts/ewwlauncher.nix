{ config, lib, pkgs, uservars, tempvar, ... }:

{
  home.file.".scripts/ewwlauncher.sh" = {
    executable = true;
    text = ''
#!/run/current-system/sw/bin/bash

eww daemon
eww open popup-power-window --config ${tempvar}/ewwmy/
eww open bar-test --config ${tempvar}/ewwmy/
bash ${config.home.homeDirectory}/.scripts/eww_ws.sh"
    '';
  };
}