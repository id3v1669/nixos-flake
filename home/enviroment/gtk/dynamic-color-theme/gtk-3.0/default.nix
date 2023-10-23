{ config, lib, pkgs, uservars, ... }:
{
  imports = [
		./gtk-css.nix
		./widgets
		./apps
	];
}