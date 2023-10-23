{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/widgets/popover.css".text = ''
/************
 * popovers *
 ************/
.popover{
    margin: 10px;
    padding: 2px;
    border-radius: 2px;
    border: 1px solid shade(@bg_color, 0.85);
    background-clip: border-box;
    background-color: @base_color;
    box-shadow: 0 2px 6px 1px rgba(0, 0, 0, 0.12);
    color: @fg_color;
}

GtkPopover.osd {
    box-shadow: 0 2px 7px 3px alpha(black, 0.5);
}

GtkPopover .button {
    background-color: transparent;
    color: @fg_color;
    border: none;
}

GtkPopover .button:hover,
GtkPopover .button:active:hover,
GtkPopover .button:checked:checked {
    background-color: transparent;
    color: @selected_bg_color;
    border: none;
}

GtkPopover > .list,
GtkPopover > .view,
GtkPopover > .toolbar {
    background-color: transparent;
}

GtkPopover.osd > .toolbar .button {
    border-radius: 0;
    border-width: 0;
    background-image: none;
    background-color: transparent;
}

GtkPopover .separator {
    border: 0;
    background-color: transparent;
    color: alpha(currentColor, 0.3);
    font-size: 80%;
    font-weight: bold;
}

GtkModelButton.button,
GtkModelButton.button:active,
GtkModelButton.button:insensitive,
GtkModelButton.button:active:insensitive {
    background-color: transparent;
    background-image: none;
    box-shadow: none;
    color: @fg_color;
}

GtkModelButton.button:active:hover,
GtkModelButton.button:hover,
GtkModelButton.button:selected {
    background-color: transparent;
    background-image: none;
    color: @selected_bg_color;
}

GtkPopover *:hover {
    -gtk-image-effect: none;
}
  '';
}
