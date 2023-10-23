{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/widgets/spinbutton.css".text = ''
/**************
 * spinbutton *
 **************/
.spinbutton.entry {
    border: solid 1px mix(@bg_color,black, 0.2);
}

.spinbutton.button {
    padding: 4px;
    border-style: none;
    border-radius: 0;
    border-bottom-right-radius: 4px;
    background-color: transparent;
    color: @theme_fg_color;
}

.spinbutton.button:active {
    transition: 500ms linear;
    border-style: none;
    border-radius: 0;
    background-color: transparent;
    color: shade(@theme_selected_bg_color, 0.9);
}

.spinbutton.button:hover {
    transition: all 500ms linear;
    border-style: none;
    border-radius: 0;
    color: @theme_selected_bg_color;
}

.spinbutton.button:insensitive {
    border-color: alpha(@theme_bg_color, 0.01);
    color: mix(@theme_fg_color, @theme_bg_color, 0.5);
}

.spinbutton.button {
    border-radius: 0;
    border-style: solid;
    border-width: 0;
}

.spinbutton.button:first-child {
    border-radius: 0;
}

.spinbutton.button:last-child {
    border-radius: 0;
    border-bottom-left-radius: 0;
    border-top-left-radius: 0;
    border-right-color: mix(@bg_color,black, 0.2);
    border-style: solid;
}

.spinbutton.vertical .button:first-child {
    border-bottom-width: 0;
    border-radius: 4px;
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0;
    border: solid 1px mix(@bg_color,black, 0.2);
    border-bottom: none;    
}

.spinbutton.vertical .button:last-child {
    border-width: 1px;
    border-top-width: 0;
    border-radius: 4px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    border: solid 1px mix(@bg_color,black, 0.2);
    border-top: none;  
}

.spinbutton.vertical.entry {
    border: solid 1px mix(@bg_color,black, 0.2);
    border-width: 1px;
    border-style: solid;
    border-radius: 0;
}
  '';
}
