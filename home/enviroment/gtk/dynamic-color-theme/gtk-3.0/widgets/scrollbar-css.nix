{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/widgets/scrollbar.css".text = ''
/*************
 * scrollbar *
 *************/
.scrollbar {
    border-width: 0px;
    border-style: none;
    padding: 0;

    background-clip: padding-box;
}

.scrollbars-junction,
.scrollbar.trough {
    border: solid 3px transparent;  
    border-radius: 0;
    background-color: transparent;
    background-image: none;
}

.scrollbar.button,
.scrollbar.button:active,
.scrollbar.button:active:hover {
    border-width: 0;
    border-radius: 0;
    background-color: transparent;
    background-image: none;
    color: shade(@theme_bg_color, 0.6);
}

.scrollbar.slider {
    padding: 10px;
    border-width: 3px;
    border-color: transparent;
    border-radius: 7px;
    border-style: solid;
    background-color: mix(@theme_bg_color, @theme_fg_color, 0.3);
}

.scrollbar.slider:hover,
.scrollbar.slider.vertical:hover {
    background-color: mix(@theme_bg_color, @theme_fg_color, 0.4);
}

.scrollbar.slider:active,
.scrollbar.slider.vertical:active {
    background-color: shade(@theme_selected_bg_color, 0.95);
}

.scrollbar.slider.fine-tune:prelight:active {
      background-size: 50%;
      background-repeat: no-repeat;
      background-position: center;
}

/* overlay scrollbar */
OsThumb {
    color: shade(@theme_bg_color, 0.7);
}

OsThumb:selected,
OsScrollbar:selected {
    background-color: @theme_selected_bg_color;
}

OsThumb:active,
OsScrollbar:active {
    background-color: @theme_selected_bg_color;
}

OsThumb:insensitive,
OsScrollbar:insensitive {
    background-color: shade(@theme_bg_color, 0.9);
}
  '';
}
