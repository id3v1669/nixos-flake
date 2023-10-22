{ config, lib, pkgs, uservars, ... }:
{
  imports = [
    ./gtk.nix
    ./gtk-dark.nix
  ];
}