{ config, lib, pkgs, uservars, ... }:
{
  imports = [
		./gtk-css.nix
    ./gtk-dark-css.nix
    ./assets
	];
  #home.file.".themes/dynamic-color-theme/metacity-1/close_focused_normal.png".source = ./. + "/close_focused_normal.png";
}