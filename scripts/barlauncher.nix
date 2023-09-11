{ config, lib, pkgs, tempvar, ... }:

{
  home.file.".scripts/barlaunch.sh" = {
    executable = true;
    text = ''
#!/run/current-system/sw/bin/bash

eww open popup-power-window --config ${tempvar}/ewwmy/
eww open bar-test --config ${tempvar}/ewwmy/
waybar

    '';
  };
}