{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./style.nix
  ];
    programs.waybar = {
      enable = true;
      systemd = {
        enable = false;
        target = "graphical-session.target";
      };
      
      settings = [{
        "layer" = "top";
        "position" = "top";
        "height" = 30;
        "width" = 300;
        "spacing" = 0;
        modules-center = [
          "tray"
        ];
        "tray" = {
          "icon-size" = 15;
          "spacing" = 5;
        };
      }];
    };
}
