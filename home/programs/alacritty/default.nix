{ config
, ...
}:
{
  programs.alacritty = {
    enable = true;
    settings = {
      shell.program = "fish";
      colors = {
        primary = {
          background = "#${config.colorScheme.colors.base00}"; # base
          foreground = "#${config.colorScheme.colors.base05}"; # text
          # Bright and dim foreground colors
          dim_foreground = "#${config.colorScheme.colors.base05}"; # text
          bright_foreground = "#${config.colorScheme.colors.base05}"; # text
        };
        # Cursor colors
        cursor = {
          text = "#${config.colorScheme.colors.base00}"; # base
          cursor = "#${config.colorScheme.colors.base06}"; # rosewater
        };
        vi_mode_cursor = {
          text = "#${config.colorScheme.colors.base00}"; # base
          cursor = "#${config.colorScheme.colors.base07}"; # lavender
        };
        # Search colors
        search = {
          matches = {
            foreground = "#${config.colorScheme.colors.base00}"; # base
            background = "#${config.colorScheme.colors.base02}"; # subtext0
          };
          focused_match = {
            foreground = "#${config.colorScheme.colors.base00}"; # base
            background = "#${config.colorScheme.colors.base0B}"; # green
          };
          footer_bar = {
            foreground = "#${config.colorScheme.colors.base00}"; # base
            background = "#${config.colorScheme.colors.base02}"; # subtext0
          };
        };
        # Keyboard regex hints
        hints = {
          start = {
            foreground = "#${config.colorScheme.colors.base00}"; # base
            background = "#${config.colorScheme.colors.base0A}"; # yellow
          };
          end = {
            foreground = "#${config.colorScheme.colors.base00}"; # base
            background = "#${config.colorScheme.colors.base02}"; # subtext0
          };
        };
        # Selection colors
        selection = {
          text = "#${config.colorScheme.colors.base00}"; # base
          background = "#${config.colorScheme.colors.base06}"; # rosewater
        };
        # Normal colors
        normal = {
          black = "#${config.colorScheme.colors.base03}"; # surface1
          red = "#${config.colorScheme.colors.base08}"; # red
          green = "#${config.colorScheme.colors.base0B}"; # green
          yellow = "#${config.colorScheme.colors.base0A}"; # yellow
          blue = "#${config.colorScheme.colors.base0D}"; # blue
          magenta = "#${config.colorScheme.colors.base0F}"; # pink
          cyan = "#${config.colorScheme.colors.base0C}"; # teal
          white = "#${config.colorScheme.colors.base06}"; # subtext1
        };
        # Bright colors
        bright = {
          black = "#${config.colorScheme.colors.base04}"; # surface2
          red = "#${config.colorScheme.colors.base08}"; # red
          green = "#${config.colorScheme.colors.base0B}"; # green
          yellow = "#${config.colorScheme.colors.base0A}"; # yellow
          blue = "#${config.colorScheme.colors.base0D}"; # blue
          magenta = "#${config.colorScheme.colors.base0F}"; # pink
          cyan = "#${config.colorScheme.colors.base0C}"; # teal
          white = "#${config.colorScheme.colors.base02}"; # subtext0
        };
        # Dim colors
        dim = {
          black = "#${config.colorScheme.colors.base03}"; # surface1
          red = "#${config.colorScheme.colors.base08}"; # red
          green = "#${config.colorScheme.colors.base0B}"; # green
          yellow = "#${config.colorScheme.colors.base0A}"; # yellow
          blue = "#${config.colorScheme.colors.base0D}"; # blue
          magenta = "#${config.colorScheme.colors.base0F}"; # pink
          cyan = "#${config.colorScheme.colors.base0C}"; # teal
          white = "#${config.colorScheme.colors.base06}"; # subtext1
        };
        # primary = {
        #   background = "#${config.colorScheme.colors.base01}";
        #   foreground = "#${config.colorScheme.colors.base06}";
        # };
        # cursor = {
        #   text = "#${config.colorScheme.colors.base05}";
        #   cursor = "#${config.colorScheme.colors.base06}";
        # };
        # normal = {
        #   black = "#${config.colorScheme.colors.base00}";
        #   red = "#${config.colorScheme.colors.base08}";
        #   green = "#${config.colorScheme.colors.base0B}";
        #   yellow = "#${config.colorScheme.colors.base0F}";
        #   blue = "#${config.colorScheme.colors.base0D}";
        #   magenta = "#${config.colorScheme.colors.base05}";
        #   cyan = "#${config.colorScheme.colors.base0C}";
        #   white = "#${config.colorScheme.colors.base06}";
        # };
        # bright = {
        #   black = "#${config.colorScheme.colors.base01}";
        #   red = "#${config.colorScheme.colors.base09}";
        #   green = "#${config.colorScheme.colors.base0B}";
        #   yellow = "#${config.colorScheme.colors.base0F}";
        #   blue = "#${config.colorScheme.colors.base0D}";
        #   magenta = "#${config.colorScheme.colors.base05}";
        #   cyan = "#${config.colorScheme.colors.base0C}";
        #   white = "#${config.colorScheme.colors.base07}";
        # };
      };
    };
  };
}
