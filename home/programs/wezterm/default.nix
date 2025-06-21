{config, ...}: {
  programs.wezterm = {
    enable = true;
    colorSchemes = with config.palette; {
      mainTheme = {
        background = "${base06.hexT}";
        foreground = "${base00.hexT}";
        ansi = [
          "${base04.hexT}" # Black
          "${base08.hexT}" # Red
          "${base11.hexT}" # Green
          "${base0E.hexT}" # Yellow
          "${base17.hexT}" # Blue
          "${base1A.hexT}" # Magenta
          "${base14.hexT}" # Cyan
          "${base00.hexT}" # White
        ];
        brights = [
          "${base05.hexT}" # Bright Black
          "${base09.hexT}" # Bright Red
          "${base12.hexT}" # Bright Green
          "${base0F.hexT}" # Bright Yellow
          "${base18.hexT}" # Bright Blue
          "${base1B.hexT}" # Bright Magenta
          "${base15.hexT}" # Bright Cyan
          "${base01.hexT}" # Bright White
        ];
        cursor_bg = "${base02.hexT}";
        cursor_border = "${base02.hexT}";
        cursor_fg = "${base06.hexT}";
        selection_bg = "${base03.hexT}";
        selection_fg = "${base06.hexT}";
      };
    };
    extraConfig = ''
      return {
        color_scheme = "mainTheme",
        check_for_updates = false,
        enable_wayland = true,
        font = wezterm.font("0xProto"),
        font_size = 11,
        window_background_opacity = 0.95,
        enable_tab_bar = false,
      }
    '';
  };
}
