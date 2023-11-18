{ config, lib, pkgs, uservars, ... }:
{
  imports = [
		./gtkrc.nix
    ./gtkrc-hidpi.nix
	];
}