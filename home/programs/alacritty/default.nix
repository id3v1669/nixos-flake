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
          background = "#${config.colorScheme.palette.base00}"; # base
          foreground = "#${config.colorScheme.palette.base05}"; # text
          # Bright and dim foreground colors
          dim_foreground = "#${config.colorScheme.palette.base05}"; # text
          bright_foreground = "#${config.colorScheme.palette.base05}"; # text
        };
        # Cursor colors
        cursor = {
          text = "#${config.colorScheme.palette.base00}"; # base
          cursor = "#${config.colorScheme.palette.base06}"; # rosewater
        };
        vi_mode_cursor = {
          text = "#${config.colorScheme.palette.base00}"; # base
          cursor = "#${config.colorScheme.palette.base07}"; # lavender
        };
        # footer bar
        footer_bar = {
          foreground = "#${config.colorScheme.palette.base00}"; # base
          background = "#${config.colorScheme.palette.base02}"; # subtext0
        };
        # Search colors
        search = {
          matches = {
            foreground = "#${config.colorScheme.palette.base00}"; # base
            background = "#${config.colorScheme.palette.base02}"; # subtext0
          };
          focused_match = {
            foreground = "#${config.colorScheme.palette.base00}"; # base
            background = "#${config.colorScheme.palette.base0B}"; # green
          };
        };
        # Keyboard regex hints
        hints = {
          start = {
            foreground = "#${config.colorScheme.palette.base00}"; # base
            background = "#${config.colorScheme.palette.base0A}"; # yellow
          };
          end = {
            foreground = "#${config.colorScheme.palette.base00}"; # base
            background = "#${config.colorScheme.palette.base02}"; # subtext0
          };
        };
        # Selection colors
        selection = {
          text = "#${config.colorScheme.palette.base00}"; # base
          background = "#${config.colorScheme.palette.base06}"; # rosewater
        };
        # Normal colors
        normal = {
          black = "#${config.colorScheme.palette.base03}"; # surface1
          red = "#${config.colorScheme.palette.base08}"; # red
          green = "#${config.colorScheme.palette.base0B}"; # green
          yellow = "#${config.colorScheme.palette.base0A}"; # yellow
          blue = "#${config.colorScheme.palette.base0D}"; # blue
          magenta = "#${config.colorScheme.palette.base0F}"; # pink
          cyan = "#${config.colorScheme.palette.base0C}"; # teal
          white = "#${config.colorScheme.palette.base06}"; # subtext1
        };
        # Bright colors
        bright = {
          black = "#${config.colorScheme.palette.base04}"; # surface2
          red = "#${config.colorScheme.palette.base08}"; # red
          green = "#${config.colorScheme.palette.base0B}"; # green
          yellow = "#${config.colorScheme.palette.base0A}"; # yellow
          blue = "#${config.colorScheme.palette.base0D}"; # blue
          magenta = "#${config.colorScheme.palette.base0F}"; # pink
          cyan = "#${config.colorScheme.palette.base0C}"; # teal
          white = "#${config.colorScheme.palette.base02}"; # subtext0
        };
        # Dim colors
        dim = {
          black = "#${config.colorScheme.palette.base03}"; # surface1
          red = "#${config.colorScheme.palette.base08}"; # red
          green = "#${config.colorScheme.palette.base0B}"; # green
          yellow = "#${config.colorScheme.palette.base0A}"; # yellow
          blue = "#${config.colorScheme.palette.base0D}"; # blue
          magenta = "#${config.colorScheme.palette.base0F}"; # pink
          cyan = "#${config.colorScheme.palette.base0C}"; # teal
          white = "#${config.colorScheme.palette.base06}"; # subtext1
        };
        # primary = {
        #   background = "#${config.colorScheme.palette.base01}";
        #   foreground = "#${config.colorScheme.palette.base06}";
        # };
        # cursor = {
        #   text = "#${config.colorScheme.palette.base05}";
        #   cursor = "#${config.colorScheme.palette.base06}";
        # };
        # normal = {
        #   black = "#${config.colorScheme.palette.base00}";
        #   red = "#${config.colorScheme.palette.base08}";
        #   green = "#${config.colorScheme.palette.base0B}";
        #   yellow = "#${config.colorScheme.palette.base0F}";
        #   blue = "#${config.colorScheme.palette.base0D}";
        #   magenta = "#${config.colorScheme.palette.base05}";
        #   cyan = "#${config.colorScheme.palette.base0C}";
        #   white = "#${config.colorScheme.palette.base06}";
        # };
        # bright = {
        #   black = "#${config.colorScheme.palette.base01}";
        #   red = "#${config.colorScheme.palette.base09}";
        #   green = "#${config.colorScheme.palette.base0B}";
        #   yellow = "#${config.colorScheme.palette.base0F}";
        #   blue = "#${config.colorScheme.palette.base0D}";
        #   magenta = "#${config.colorScheme.palette.base05}";
        #   cyan = "#${config.colorScheme.palette.base0C}";
        #   white = "#${config.colorScheme.palette.base07}";
        # };
      };
    };
  };
}
