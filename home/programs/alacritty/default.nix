{ config, lib, pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      shell.program = "fish";
      colors = {
        primary = {
          background = "#${config.colorScheme.colors.base01}";
          foreground = "#${config.colorScheme.colors.base02}";
        };
        cursor = {
          text = "#${config.colorScheme.colors.base05}";
          cursor = "#${config.colorScheme.colors.base06}";
        };
        normal = {
          black = "#${config.colorScheme.colors.base00}";
          red = "#${config.colorScheme.colors.base09}";
          green = "#${config.colorScheme.colors.base0E}";
          yellow = "#${config.colorScheme.colors.base0F}";
          blue = "#${config.colorScheme.colors.base0D}";
          magenta = "#${config.colorScheme.colors.base0C}";
          cyan = "#${config.colorScheme.colors.base0B}";
          white = "#${config.colorScheme.colors.base05}";
        };
        bright = {
          black = "#${config.colorScheme.colors.base01}";
          red = "#${config.colorScheme.colors.base09}";
          green = "#${config.colorScheme.colors.base0E}";
          yellow = "#${config.colorScheme.colors.base0F}";
          blue = "#${config.colorScheme.colors.base0D}";
          magenta = "#${config.colorScheme.colors.base0C}";
          cyan = "#${config.colorScheme.colors.base0B}";
          white = "#${config.colorScheme.colors.base05}";
        };      
        # primary = {
        #   background = "0x282433";
        #   foreground = "0xeee9fc";
        # };
        # cursor = {
        #   text = "0xeee9fc";
        #   cursor = "0xeee9fc";
        # };
        # normal = {
        #   black = "0x282433";
        #   red = "0xe965a5";
        #   green = "0xb1f2a7";
        #   yellow = "0xebde76";
        #   blue = "0xb1baf4";
        #   magenta = "0xe192ef";
        #   cyan = "0xb3f4f3";
        #   white = "0xeee9fc";
        # };
        # bright = {
        #   black = "0x3f3951";
        #   red = "0xe965a5";
        #   green = "0xb1f2a7";
        #   yellow = "0xebde76";
        #   blue = "0xb1baf4";
        #   magenta = "0xe192ef";
        #   cyan = "0xb3f4f3";
        #   white = "0xeee9fc";
        # };      
      };
    };
  };
}
