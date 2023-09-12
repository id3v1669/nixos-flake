{ config, lib, pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      shell.program = "fish";
      colors = {
        primary = {
          background = "#${config.colorScheme.colors.base01}";
          foreground = "#${config.colorScheme.colors.base06}";
        };
        cursor = {
          text = "#${config.colorScheme.colors.base05}";
          cursor = "#${config.colorScheme.colors.base06}";
        };
        normal = {
          black = "#${config.colorScheme.colors.base00}";
          red = "#${config.colorScheme.colors.base08}";
          green = "#${config.colorScheme.colors.base0B}";
          yellow = "#${config.colorScheme.colors.base0F}";
          blue = "#${config.colorScheme.colors.base0D}";
          magenta = "#${config.colorScheme.colors.base0E}";
          cyan = "#${config.colorScheme.colors.base0C}";
          white = "#${config.colorScheme.colors.base06}";
        };
        bright = {
          black = "#${config.colorScheme.colors.base01}";
          red = "#${config.colorScheme.colors.base09}";
          green = "#${config.colorScheme.colors.base0B}";
          yellow = "#${config.colorScheme.colors.base0F}";
          blue = "#${config.colorScheme.colors.base0D}";
          magenta = "#${config.colorScheme.colors.base0E}";
          cyan = "#${config.colorScheme.colors.base0C}";
          white = "#${config.colorScheme.colors.base07}";
        };
      };
    };
  };
}
