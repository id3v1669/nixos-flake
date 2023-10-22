{ config, lib, pkgs, uservars, ... }:
{
  imports = [
    ./assets
    ./gtk-3.0
    ./gtk-3.20
  ];
  home.file.".themes/dynamic-color-theme/index.theme".text = ''
[Desktop Entry]
Type=X-GNOME-Metatheme
Name=dynamic-color-theme
Comment=Viva la NixOs
Encoding=UTF-8

[X-GNOME-Metatheme]
Name=dynamic-color-theme
GtkTheme=dynamic-color-theme
IconTheme=dynamic-color-theme
MetacityTheme=dynamic-color-theme
  '';
}