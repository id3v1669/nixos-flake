{ config, lib, pkgs, uservars, tempvar, ... }:

{
  home.file.".scripts/ewwlauncher.sh" = {
    executable = true;
    text = ''
#!/run/current-system/sw/bin/bash

GTK_THEME=nobg-GTK eww daemon
GTK_THEME=nobg-GTK eww open popup-power-window --config ${tempvar}/ewwmy/
GTK_THEME=nobg-GTK eww open bar-test --config ${tempvar}/ewwmy/
    '';
  };
}