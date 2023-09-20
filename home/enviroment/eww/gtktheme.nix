{ config, lib, pkgs, uservars, tempvar, ... }:

{
  home.file.".local/share/themes/nobg-GTK/index.theme".text = ''
[Desktop Entry]
Type=X-GNOME-Metatheme
Name=nobg
Comment= Dark version
Encoding=UTF-8
[X-GNOME-Metatheme]
GtkTheme=nobg
MetacityTheme=nobg
IconTheme=nobg
CursorTheme=nogb
ButtonLayout=:minimize,maximize,close
    '';

  home.file.".local/share/themes/nobg-GTK/gtk-3.0/gtk.css".text = ''
.background { 
color: rgba(0, 0, 0, 0);
background-color: rgba(0, 0, 0, 0);
}
    '';
}