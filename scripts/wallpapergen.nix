{ config
, uservars
, colorsvar
, envir
, ...
}:
let
  launch = if (envir == "Hyprland") then ''
kill $(pidof hyprpaper)
hyprpaper &
  '' else if (envir == "sway") then ''
kill $(pidof swaybg)
swaybg -i ~/Pictures/Wallpapers/${colorsvar}/$_image -m fill &
  '' else '''';
in
{
  home.file.".scripts/wallpaper.sh" = {
    executable = true;
    text = ''
#!/usr/bin/env bash

_image="${uservars.wp}"

if [ ! -f "${config.home.homeDirectory}/Pictures/Wallpapers/${colorsvar}/$_image" ]; then
  if [ ! -d "${config.home.homeDirectory}/Pictures/Wallpapers/${colorsvar}" ]; then
    mkdir "${config.home.homeDirectory}/Pictures/Wallpapers/${colorsvar}"
  fi
  lutgen apply ${config.home.homeDirectory}/Pictures/Wallpapers/$_image -o ${config.home.homeDirectory}/Pictures/Wallpapers/${colorsvar} -- "#ABCDEF" ${config.colorScheme.palette.base01} ${config.colorScheme.palette.base04} ${config.colorScheme.palette.base05} ${config.colorScheme.palette.base06} ${config.colorScheme.palette.base07} ${config.colorScheme.palette.base08} ${config.colorScheme.palette.base09} ${config.colorScheme.palette.base0A} ${config.colorScheme.palette.base0B} ${config.colorScheme.palette.base0C} ${config.colorScheme.palette.base0D} ${config.colorScheme.palette.base0E} ${config.colorScheme.palette.base0F}
fi

${launch}
    '';
  };
}