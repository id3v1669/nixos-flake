{ config, lib, pkgs, ... }:
let 
  modifier = "SUPER";
in
{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "alacritty"; 
      startup = [
        {command = "waybar";}
      ];
      keybindings = {
        "${modifier}+Shift+f" = "fullscreen toggle global";

        "XF86AudioRaiseVolume" = "exec ${pkgs.avizo}/bin/volumectl -u up";
        "XF86AudioLowerVolume" = "exec ${pkgs.avizo}/bin/volumectl -u down";
        "XF86AudioMute" = "exec ${pkgs.avizo}/bin/volumectl toggle-mute";

        "${modifier}+Shift+b" = "exec firefox";
        "${modifier}+Shift+t" = "exec alacritty";
      };
    };
    extraOptions = [ "--unsupported-gpu" ];
  };
}