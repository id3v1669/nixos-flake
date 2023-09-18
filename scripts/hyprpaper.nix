{ config, lib, pkgs, uservars, ... }:

{
  home.file.".scripts/hyprpaper.sh" = {
    executable = true;
    text = ''
#!/run/current-system/sw/bin/bash

hyprpaper &
hyprctl hyprpaper wallpaper 'DP-3,/home/user/Pictures/Wallpapers/rebecca2.jpg'
hyprctl hyprpaper wallpaper 'DP-4,/home/user/Pictures/Wallpapers/furry1.png'

    '';
  };
}