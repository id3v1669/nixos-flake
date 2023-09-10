{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./../universal.nix
  ];
  home = {
    sessionVariables = {
    };
  };

  #wayland.windowManager.hyprland.settings.monitor = "HDMI-A-1,3440x1440@100,0x0,1";
}