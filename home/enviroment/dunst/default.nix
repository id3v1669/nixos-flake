{ config, lib, pkgs, ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        rounded = true;
        #monitor = 0;
        follow = "mouse";
        width = 400;
        height = 400;
        origin = "top-right";
        offset = "15x15";
        scale = 0;
        progress_bar = false;
        indicate_hidden = true;
        transparency = 0;
        separator_height = 2;
        padding = 10;
        horizontal_padding = 10;
        text_icon_padding = 0;
        frame_width = 1;
        gap_size = 0;
        sort = true;
        idle_threshold = 120;
        font = "Source Sans Pro 10";
        line_height = 0;
        markup = "full";
        format = "<span foreground='#${config.colorScheme.colors.base06}'><b>%s %p</b></span>\n%b";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = false;
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = true;
        sticky_history = true;
        history_length = 20;
        always_run_script = true;
        corner_radius = 10;
        ignore_dbusclose = false;
        force_xinerama = false;
        mouse_left_click = "do_action, close_current";
        mouse_middle_click = "close_current";
        mouse_right_click = "close_all";
        notification_limit = 5;
        frame_color = "#${config.colorScheme.colors.base05}";
        separator_color = "#${config.colorScheme.colors.base05}";
        background = "#${config.colorScheme.colors.base02}";
        foreground = "#${config.colorScheme.colors.base05}";
      };
    };
  };
}