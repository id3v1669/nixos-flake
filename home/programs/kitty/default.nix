{ config
, ...
}:
{
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close=0;
      scrollback_lines = 20000;
      enable_audio_bell = false;
    };
    extraConfig = with config.palette; ''
# The basic colors
foreground              ${base00.hexT}
background              ${base06.hexT}
selection_foreground    ${base06.hexT}
selection_background    ${base05.hexT}

# Cursor colors
cursor                  ${base05.hexT}
cursor_text_color       ${base06.hexT}

# URL underline color when hovering with mouse
url_color               ${base05.hexT}

# Kitty window border colors
active_border_color     ${base01.hexT}
inactive_border_color   ${base07.hexT}
bell_border_color       ${base0E.hexT}

# OS Window titlebar colors
wayland_titlebar_color system
macos_titlebar_color system

# Tab bar colors
active_tab_foreground   ${base07.hexT}
active_tab_background   ${base1D.hexT}
inactive_tab_foreground ${base00.hexT}
inactive_tab_background ${base04.hexT}
tab_bar_background      ${base07.hexT}

# Colors for marks (marked text in the terminal)
mark1_foreground ${base06.hexT}
mark1_background ${base01.hexT}
mark2_foreground ${base06.hexT}
mark2_background ${base1D.hexT}
mark3_foreground ${base06.hexT}
mark3_background ${base00.hexT}

# The 16 terminal colors

# black
color0 ${base05.hexT}
color8 ${base06.hexT}

# red
color1 ${base09.hexT}
color9 ${base0A.hexT}

# green
color2  ${base12.hexT}
color10 ${base13.hexT}

# yellow
color3  ${base0F.hexT}
color11 ${base10.hexT}

# blue
color4  ${base17.hexT}
color12 ${base19.hexT}

# magenta
color5  ${base1B.hexT}
color13 ${base1C.hexT}

# cyan
color6  ${base15.hexT}
color14 ${base16.hexT}

# white
color7  ${base01.hexT}
color15 ${base02.hexT}
    '';
  };
}