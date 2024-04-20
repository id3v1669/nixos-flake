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
        bg = mkLiteral "#${config.colorScheme.palette.base00}6B";
        bg-alt = mkLiteral "#${config.colorScheme.palette.base02}6B";
        bg-selected = mkLiteral "#${config.colorScheme.palette.base01}66";
        fg = mkLiteral "#${config.colorScheme.palette.base05}";
        fg-alt = mkLiteral "#${config.colorScheme.palette.base08}";
        fg-green = mkLiteral "#${config.colorScheme.palette.base0B}";
        cian = mkLiteral "#${config.colorScheme.palette.base0C}";
        border = 0;
        margin = 0;
        padding = 0;
        spacing = 0;
      };
      "window" = {
        width = mkLiteral "30%";
        background-color = mkLiteral "@bg";
        border-radius = 20;
      };
      "element" = {
        padding = mkLiteral "8 12";
        background-color = mkLiteral "@bg-alt";
        text-color = mkLiteral "@fg-green";
      };
      "element selected" = {
        text-color = mkLiteral "@cian";
        background-color = mkLiteral "@bg-selected";
      };
      "element-text" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
      };
      "element-icon" = {
        padding = mkLiteral "2 5";
        background-color = mkLiteral "transparent";
        size = mkLiteral "1.2em";
      };
      "entry" = {
        padding = 12;
        background-color = mkLiteral "@bg-alt";
        text-color = mkLiteral "@fg";
      };
      "inputbar" = {
        children = map mkLiteral ["icon-search" "prompt" "entry"];
        border = 3;
        border-radius = 10;
        background-color = mkLiteral "@bg";
        border-color = mkLiteral "@cian";
      };
      "icon-search" =  {
        padding = mkLiteral "2 5";
        expand = false;
        filename = "search";
        background-color = mkLiteral "@bg-alt";
        vertical-align = mkLiteral "0.5";
      };
      "listview" = {
        background-color = mkLiteral "@bg";
        columns = 1;
        lines = 10;
      };
      "mainbox" = {
        padding = 12;
        children = map mkLiteral ["inputbar" "listview"];
        background-color = mkLiteral "@bg";
        border-color = mkLiteral "@bg-alt";
      };
      "prompt" = {
      enabled = true;
      padding = mkLiteral "12 0 0 12";
        background-color = mkLiteral "@bg-alt";
        text-color = mkLiteral "@fg";
      };
    };
    extraConfig = {
      show-icons = true;
      modi = "drun,calc,ssh";
      kb-primary-paste = "Control+V,Shift+Insert";
      kb-secondary-paste = "Control+v,Insert";
      display-drun = "Applications:";
      display-window = "Windows:";
      drun-display-format = "{name}";
    };
  };
}