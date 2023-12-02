{ config, lib, pkgs, uservars, colorsvar, ... }:
{
  home.file.".scripts/wallpaper.sh" = {
    executable = true;
    text = ''
#!/usr/bin/env bash

if [ ! -f "${config.home.homeDirectory}/Pictures/Wallpapers/${colorsvar}/${uservars.wp}" ]; then
  if [ ! -d "${config.home.homeDirectory}/Pictures/Wallpapers/${colorsvar}" ]; then
    mkdir "${config.home.homeDirectory}/Pictures/Wallpapers/${colorsvar}"
  fi
  lutgen apply ${config.home.homeDirectory}/Pictures/Wallpapers/${uservars.wp} -o ${config.home.homeDirectory}/Pictures/Wallpapers/${colorsvar}/${uservars.wp} -- "#ABCDEF" ${config.colorScheme.colors.base01} ${config.colorScheme.colors.base04} ${config.colorScheme.colors.base05} ${config.colorScheme.colors.base06} ${config.colorScheme.colors.base07} ${config.colorScheme.colors.base08} ${config.colorScheme.colors.base09} ${config.colorScheme.colors.base0A} ${config.colorScheme.colors.base0B} ${config.colorScheme.colors.base0C} ${config.colorScheme.colors.base0D} ${config.colorScheme.colors.base0E} ${config.colorScheme.colors.base0F}
fi

swaybg -i ~/Pictures/Wallpapers/${colorsvar}/${uservars.wp} -m fill &
    '';
  };
}