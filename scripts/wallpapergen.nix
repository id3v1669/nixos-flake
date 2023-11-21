{ config, lib, pkgs, uservars, colorsvar, ... }:
{
  #imgs=(${lib.concatMapStrings (item: ''${item} '') uservars.wallpapers})
  home.file.".scripts/wallpapergen.sh" = {
    executable = true;
    text = ''
#!/usr/bin/env bash

imgs=(${uservars.wp1} ${uservars.wp2})

for img in "''${imgs[@]}"; do
  if [ ! -f "${config.home.homeDirectory}/Pictures/Wallpapers/${colorsvar}/''${img}" ]; then
    if [ ! -d "${config.home.homeDirectory}/Pictures/Wallpapers/${colorsvar}" ]; then
      mkdir "${config.home.homeDirectory}/Pictures/Wallpapers/${colorsvar}"
    fi
    lutgen apply ${config.home.homeDirectory}/Pictures/Wallpapers/''${img} -o ${config.home.homeDirectory}/Pictures/Wallpapers/${colorsvar}/''${img} -- "#ABCDEF" ${config.colorScheme.colors.base01} ${config.colorScheme.colors.base04} ${config.colorScheme.colors.base05} ${config.colorScheme.colors.base06} ${config.colorScheme.colors.base07} ${config.colorScheme.colors.base08} ${config.colorScheme.colors.base09} ${config.colorScheme.colors.base0A} ${config.colorScheme.colors.base0B} ${config.colorScheme.colors.base0C} ${config.colorScheme.colors.base0D} ${config.colorScheme.colors.base0E} ${config.colorScheme.colors.base0F}
  fi
done
    '';
  };
}