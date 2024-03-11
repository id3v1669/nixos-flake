{ config
, lib
, pkgs
, ...
}:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    cycle = false;
    location = "center";
    font = "JetBrainsMono Nerd Font Medium 10";
    plugins = (with pkgs; [
      over-rofi-calc
      rofi-mpd
      over-rofi-emoji
    ]);
    theme = let inherit (config.lib.formats.rasi) mkLiteral; in  
    {
      "*" = {
        bg = mkLiteral "#${config.colorScheme.palette.base00}66";
        bg-alt = mkLiteral "#${config.colorScheme.palette.base02}66";
        bg-selected = mkLiteral "#${config.colorScheme.palette.base01}66";
        fg = mkLiteral "#${config.colorScheme.palette.base05}";
        fg-alt = mkLiteral "#${config.colorScheme.palette.base08}";
        border = 0;
        margin = 0;
        padding = 0;
        spacing = 0;
      };
      "window" = {
        width = mkLiteral "30%";
        background-color = mkLiteral "@bg";
      };
      "element" = {
        padding = mkLiteral "8 12";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@fg-alt";
      };
      "element selected" = {
        text-color = mkLiteral "@fg";
        background-color = mkLiteral "@bg-selected";
      };
      "element-text" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
      };
      "element-icon" = {
        size = 14;
        padding = mkLiteral "0 10 0 0";
        background-color = mkLiteral "transparent";
      };
      "entry" = {
        padding = 12;
        background-color = mkLiteral "@bg-alt";
        text-color = mkLiteral "@fg";
      };
      "inputbar" = {
        children = map mkLiteral ["prompt" "entry"];
        background-color = mkLiteral "@bg";
      };
      "listview" = {
        background-color = mkLiteral "@bg";
        columns = 1;
        lines = 10;
      };
      "mainbox" = {
        children = map mkLiteral ["inputbar" "listview"];
        background-color = mkLiteral "@bg";
      };
      "prompt" = {
      enabled = true;
      padding = mkLiteral "12 0 0 12";
        background-color = mkLiteral "@bg-alt";
        text-color = mkLiteral "@fg";
      };
    };
    extraConfig = {
      modi = "drun,calc,ssh";
      kb-primary-paste = "Control+V,Shift+Insert";
      kb-secondary-paste = "Control+v,Insert";
      display-drun = "Applications:";
      display-window = "Windows:";
      drun-display-format = "{name}";
    };
  };
}