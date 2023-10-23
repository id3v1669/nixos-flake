{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/widgets/app-notifications.css".text = ''
/*********************
 * app notifications *
 *********************/
.app-notification {
    border-style: solid;
    border-color: shade(@header_bg_color, 0.9);
    border-width: 0 1px 1px 1px;
    border-bottom-right-radius: 5px;
    border-bottom-left-radius: 5px;
    padding: 8px;
    background-color: alpha(@header_bg_color,0.95);
    background-image: none;
    color: @header_fg_color;
}

.app-notification .button,
.app-notification .button:hover {
    background-color: @cyan;
    color: @selected_fg_color;
}

.app-notification .button:active,
.app-notification .button:hover:active {
    background-color: shade(@cyan,0.9);
    color: @selected_fg_color;
}

.app-notification .button.flat {
    background-color: transparent;
    color: @header_fg_color;
}

.app-notification .button.flat:hover,
.app-notification .button.flat:hover:active {
    background-color: transparent;
    color: @red;
}
  '';
}
