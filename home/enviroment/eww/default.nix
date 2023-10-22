{ config, lib, pkgs, inputs, ... }:
{
  imports = [ 
    ./scss.nix
    ./yuck.nix
  ];
  #programs.eww = {
  #  enable = true;
  #  package = inputs.eww-tray.packages.x86_64-linux.eww-wayland;
  #  configDir = "${config.home.homeDirectory}/.config/eww";
  #};
}