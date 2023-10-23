{ config, lib, pkgs, uservars, ... }:
{
  imports = [
    ./assets
    #./gtk-3.0
    #./gtk-3.20
  ];
  home.file.".themes/dynamic-color-theme/index.theme".text = ''
[Desktop Entry]
Type=X-GNOME-Metatheme
Name=dynamic-color-theme
Comment=Viva la NixOS
Encoding=UTF-8

[X-GNOME-Metatheme]
GtkTheme=dynamic-color-theme
MetacityTheme=dynamic-color-theme
IconTheme=Adwaita
ButtonLayout=menu:minimize,maximize,close
  '';
}