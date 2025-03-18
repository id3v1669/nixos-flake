{config, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      terminal.shell = "fish";
      font = {
        normal = {
          family = "0xProto";
          style = "Regular";
        };
        bold = {
          family = "0xProto";
          style = "Bold";
        };
        italic = {
          family = "0xProto";
          style = "Italic";
        };
        bold_italic = {
          family = "0xProto";
          style = "Bold Italic";
        };
      };
      colors = with config.palette; {
        primary = {
          background = "${base06.hexT}";
          foreground = "${base00.hexT}";
          dim_foreground = "${base02.hexT}";
          bright_foreground = "${base01.hexT}";
        };
        cursor = {
          cursor = "${base02.hexT}";
          text = "${base06.hexT}";
        };
        vi_mode_cursor = {
          cursor = "${base00.hexT}";
          text = "${base06.hexT}";
        };
        search = {
          matches = {
            background = "${base13.hexT}";
            foreground = "${base04.hexT}";
          };
          focused_match = {
            background = "${base12.hexT}";
            foreground = "${base04.hexT}";
          };
        };
        hints = {
          start = {
            background = "${base0E.hexT}";
            foreground = "${base06.hexT}";
          };
          end = {
            background = "${base05.hexT}";
            foreground = "${base06.hexT}";
          };
        };
        line_indicator = {
          background = "${base0B.hexT}";
          foreground = "${base06.hexT}";
        };
        footer_bar = {
          background = "${base05.hexT}";
          foreground = "${base0B.hexT}";
        };
        selection = {
          background = "${base03.hexT}";
          text = "${base06.hexT}";
        };
        bright = {
          black = "${base05.hexT}";
          blue = "${base18.hexT}";
          cyan = "${base15.hexT}";
          green = "${base12.hexT}";
          magenta = "${base1B.hexT}";
          red = "${base09.hexT}";
          white = "${base01.hexT}";
          yellow = "${base0F.hexT}";
        };
        normal = {
          black = "${base04.hexT}";
          blue = "${base17.hexT}";
          cyan = "${base14.hexT}";
          green = "${base11.hexT}";
          magenta = "${base1A.hexT}";
          red = "${base08.hexT}";
          white = "${base00.hexT}";
          yellow = "${base0E.hexT}";
        };
        dim = {
          black = "${base07.hexT}";
          blue = "${base19.hexT}";
          cyan = "${base16.hexT}";
          green = "${base13.hexT}";
          magenta = "${base1C.hexT}";
          red = "${base0A.hexT}";
          white = "${base03.hexT}";
          yellow = "${base10.hexT}";
        };
      };
    };
  };
}
