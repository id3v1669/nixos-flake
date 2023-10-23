{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/widgets/calendar.css".text = ''
/************
 * Calendar *
 ************/
GtkCalendar {
    padding: 1px 4px 2px 4px;
}

GtkCalendar:inconsistent {
    color: mix(@fg_color, @bg_color, 0.5);
}

GtkCalendar.view,
GtkCalendar.header,
GtkCalendar.button,
GtkCalendar.button:hover,
GtkCalendar.button:insensitive {
    border-width: 0;
    background-color: transparent;
    background-image: none;
}

.highlight,
GtkCalendar.highlight {
    border-width: 0;
    background-color: transparent;
    color: @selected_bg_color;
}

GtkCalendar:selected {
    border-radius: 5px;
}

GtkCalendar:selected:selected {
    background-color: @selected_bg_color;
}
  '';
}
