{ config, lib, pkgs, uservars, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.20/gtk.gresource".source = ./gtk.gresource;
}

