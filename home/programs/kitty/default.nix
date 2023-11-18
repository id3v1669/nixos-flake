{ config, lib, pkgs, ... }: {
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close=0;
      scrollback_lines = 20000;
      enable_audio_bell = false;
    };
    extraConfig = ''
# The basic colors
foreground              #${config.colorScheme.colors.base05}
background              #${config.colorScheme.colors.base00}
selection_foreground    #${config.colorScheme.colors.base00}
selection_background    #${config.colorScheme.colors.base06}

# Cursor colors
cursor                  #${config.colorScheme.colors.base06}
cursor_text_color       #${config.colorScheme.colors.base00}

# URL underline color when hovering with mouse
url_color               #${config.colorScheme.colors.base06}

# Kitty window border colors
active_border_color     #${config.colorScheme.colors.base07}
inactive_border_color   #${config.colorScheme.colors.base02}
bell_border_color       #${config.colorScheme.colors.base0A}

# OS Window titlebar colors
wayland_titlebar_color system
macos_titlebar_color system

# Tab bar colors
active_tab_foreground   #${config.colorScheme.colors.base02}
active_tab_background   #${config.colorScheme.colors.base0E}
inactive_tab_foreground #${config.colorScheme.colors.base05}
inactive_tab_background #${config.colorScheme.colors.base01}
tab_bar_background      #${config.colorScheme.colors.base02}

# Colors for marks (marked text in the terminal)
mark1_foreground #${config.colorScheme.colors.base00}
mark1_background #${config.colorScheme.colors.base07}
mark2_foreground #${config.colorScheme.colors.base00}
mark2_background #${config.colorScheme.colors.base0E}
mark3_foreground #${config.colorScheme.colors.base00}
mark3_background #${config.colorScheme.colors.base05}

# The 16 terminal colors

# black
color0 #${config.colorScheme.colors.base03}
color8 #${config.colorScheme.colors.base04}

# red
color1 #${config.colorScheme.colors.base08}
color9 #${config.colorScheme.colors.base08}

# green
color2  #${config.colorScheme.colors.base0B}
color10 #${config.colorScheme.colors.base0B}

# yellow
color3  #${config.colorScheme.colors.base0A}
color11 #${config.colorScheme.colors.base0A}

# blue
color4  #${config.colorScheme.colors.base0D}
color12 #${config.colorScheme.colors.base0D}

# magenta
color5  #${config.colorScheme.colors.base0E}
color13 #${config.colorScheme.colors.base0E}

# cyan
color6  #${config.colorScheme.colors.base0C}
color14 #${config.colorScheme.colors.base0C}

# white
color7  #${config.colorScheme.colors.base05}
color15 #${config.colorScheme.colors.base06}
    '';
  };
}