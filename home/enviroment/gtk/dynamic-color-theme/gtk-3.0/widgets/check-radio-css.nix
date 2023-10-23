{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/widgets/check-radio.css".text = ''
/*******************
 * check and radio *
 *******************/
.check,
.radio,
.check:insensitive,
.radio:insensitive {
    border-style: none;
    background-color: transparent;
}

GtkCheckButton:hover,
GtkCheckButton:active:hover,
GtkCheckButton:selected,
GtkCheckButton:selected:focus {
    background-color: transparent;
}
  '';
}
