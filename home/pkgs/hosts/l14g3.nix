{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    spotify     # music
    gimp        # image editing
  ];
}