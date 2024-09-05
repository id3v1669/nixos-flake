{ config
, pkgs
, writeShellApplication
, envir
, colorsvar
, uservars
, ...
}:
writeShellApplication{
  name = "wallpaper-autostart";
  runtimeInputs = with pkgs; [
    lutgen
  ] ++ lib.lists.optionals (envir == "Hyprland") [
    hyprpaper
  ] ++ lib.lists.optionals (envir == "sway") [
    swaybg
  ];
  text = let
  imageFile = ./../../assets/wallpapers/${uservars.wp};
  clp = config.colorScheme.palette;
  launch = if envir == "Hyprland" then ''
kill "$(pidof hyprpaper)"
hyprpaper &
  '' else  if envir == "sway" then ''
kill "$(pidof swaybg)"
swaybg -i /etc/backgrounds/${colorsvar}/$_image &
  '' else '''';
  in ''
set +o errexit
set +o nounset
set +o pipefail

_image="${uservars.wp}"

if [ ! -f "/etc/backgrounds/${colorsvar}/$_image" ]; then
  if [ ! -d "/etc/backgrounds/${colorsvar}" ]; then
    mkdir "/etc/backgrounds/${colorsvar}"
  fi
  lutgen apply ${imageFile} -o /etc/backgrounds/${colorsvar} -- "#ABCDEF" ${clp.base01} ${clp.base04} ${clp.base05} ${clp.base06} ${clp.base07} ${clp.base08} ${clp.base09} ${clp.base0A} ${clp.base0B} ${clp.base0C} ${clp.base0D} ${clp.base0E} ${clp.base0F}
  mv /etc/backgrounds/${colorsvar}/*$_image /etc/backgrounds/${colorsvar}/$_image
fi

${launch}
  '';
}
