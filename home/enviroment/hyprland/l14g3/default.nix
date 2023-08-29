{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./hyprland-environment.nix
    ./../universal.nix
  ];

  #wayland.windowManager.hyprland.settings.monitor = "HDMI-A-1,3440x1440@100,0x0,1";
}