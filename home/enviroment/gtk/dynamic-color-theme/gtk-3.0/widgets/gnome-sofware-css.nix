{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/widgets/gnome-sofware.css".text = ''
/* Copyright 2015 Sam Hewitt.
*
* This file is part of the Paper GTK theme.
*
* The Paper GTK theme is free software: you can redistribute it
* and/or modify it under the terms of the GNU General Public License as
* published by the Free Software Foundation, either version 3 of the
* License, or (at your option) any later version.
*
* The Paper GTK theme is distributed in the hope that it will be
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
* Public License for more details.
*
* You should have received a copy of the GNU General Public License along
* with the Paper GTK theme. If not, see http://www.gnu.org/licenses/.
*/

GtkImage.star{
    color: #EF1A1A;
}
  '';
}
