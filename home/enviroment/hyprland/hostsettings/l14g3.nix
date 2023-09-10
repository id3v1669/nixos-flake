{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings.monitor = [
    "eDP-1,1920x1080@60,0x0,1"
    "DP-2,1920x1080@60,0x0,1"
  ];
}
