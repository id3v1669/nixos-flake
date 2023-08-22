{ config, lib, pkgs, ... }: 

{
  programs.rofi = {
    enable = true;
    #spackage = pkgs.rofi-wayland;
    location = "center";
    plugins = (with pkgs; [
      rofi-calc 
      rofi-mpd
      rofi-emoji
    ]);
    extraConfig = {
      modi = "drun,emoji,ssh";
      kb-primary-paste = "Control+V,Shift+Insert";
      kb-secondary-paste = "Control+v,Insert";
    };
  };
}