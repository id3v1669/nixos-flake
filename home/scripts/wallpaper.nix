{
  config,
  pkgs,
  writeShellApplication,
  envir,
  colorsvar,
  uservars,
  ...
}:
writeShellApplication {
  name = "wallpaper-autostart";
  runtimeInputs = with pkgs;
    [
      lutgen
    ]
    ++ lib.lists.optionals (envir == "Hyprland") [
      hyprpaper
    ];
  text = let
    imageFile = ./../../assets/wallpapers/${uservars.wp};
    clp = config.palette;
    launch =
      if envir == "Hyprland"
      then ''
        kill "$(pidof hyprpaper)"
        hyprpaper &
      ''
      else '''';
  in ''
    set +o errexit
    set +o nounset
    set +o pipefail

    _image="${uservars.wp}"

    if [ ! -f "/etc/backgrounds/${colorsvar}/$_image" ]; then
      if [ ! -d "/etc/backgrounds/${colorsvar}" ]; then
        mkdir "/etc/backgrounds/${colorsvar}"
      fi
      lutgen apply ${imageFile} -o /etc/backgrounds/${colorsvar} -- "#ABCDEF" ${clp.base00.hex} ${clp.base01.hex}\
        ${clp.base04.hex} ${clp.base05.hex} ${clp.base06.hex} ${clp.base07.hex} ${clp.base08.hex} ${clp.base09.hex}\
        ${clp.base0A.hex} ${clp.base0B.hex} ${clp.base0C.hex} ${clp.base0D.hex} ${clp.base0E.hex} ${clp.base0F.hex}\
        ${clp.base10.hex} ${clp.base11.hex} ${clp.base14.hex} ${clp.base15.hex} ${clp.base16.hex} ${clp.base17.hex} ${clp.base18.hex}\
        ${clp.base19.hex} ${clp.base1A.hex} ${clp.base1B.hex} ${clp.base1C.hex} ${clp.base1D.hex} ${clp.base1E.hex} ${clp.base1F.hex}
      mv /etc/backgrounds/${colorsvar}/*$_image /etc/backgrounds/${colorsvar}/$_image
    fi

    ${launch}
  '';
}
