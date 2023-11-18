{ config, lib, pkgs, uservars, ... }:
{
  imports = [
    ./assets
		./gtk-css.nix
    ./gtk-dark-css.nix
	];
}