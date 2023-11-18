{ config, lib, pkgs, uservars, ... }:
{
  imports = [
		./assets
    ./gnome-shell.nix
    ./no-events.nix
    ./no-notifications.nix
    ./pad-osd.nix
    ./process-working.nix
	];
}