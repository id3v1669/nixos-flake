{ config, lib, pkgs, uservars, ... }:
{
  imports = [
    ./gtk-2.0
    ./gtk-3.0
    ./gtk-4.0
    ./xfwm4
    ./metacity-1
    ./cinnamon
    ./gnome-shell
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
IconTheme=Catppuccin-Mocha
CursorTheme=Catppuccin-cursors
ButtonLayout=menu:minimize,maximize,close
  '';

#IconTheme=Catppuccin-Mocha
#CursorTheme=Catppuccin-cursors
}