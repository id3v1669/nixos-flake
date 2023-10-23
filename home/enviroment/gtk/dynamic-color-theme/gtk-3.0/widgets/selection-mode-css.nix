{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/widgets/selection-mode.css".text = ''
/******************
 * selection mode *
 ******************/
.selection-mode.header-bar,
.selection-mode.toolbar {
    border-style: solid;
    border-color: shade(@selected_bg_color, 0.8);
    background-color: shade(@selected_bg_color, 0.9);
    background-image: none;
    color: @base_color;
}

.selection-mode.header-bar {
    border-top-color: @selected_bg_color;
}

.selection-mode.toolbar {
    padding: 4px;
}

/* regular button */
.selection-mode.header-bar .button,
.selection-mode.toolbar .button,
.selection-mode.toolbar GtkToolButton .button {
    background-color: @selected_bg_color;
    background-image: none;
    color: @selected_fg_color;
}

.selection-mode.header-bar .button:hover,
.selection-mode.toolbar .button:hover,
.selection-mode.toolbar GtkToolButton .button:hover {
    background-color: shade(@selected_bg_color, 1.1);
    background-image: none;
}

.selection-mode.header-bar .button:active,
.selection-mode.toolbar .button:active,
.selection-mode.toolbar GtkToolButton .button:active {
    background-color: shade(@selected_bg_color, 1.2);
    background-image: none;
}

.selection-mode.header-bar .button:hover:active,
.selection-mode.toolbar .button:hover:active,
.selection-mode.toolbar GtkToolButton .button:hover:active {
    color: @theme_selected_fg_color;
}

/* suggested button */
.selection-mode.header-bar .suggested-action.button,
.selection-mode.toolbar .suggested-action.button,
.selection-mode.toolbar GtkToolButton.suggested-action .button {
    border: none;
    background-color: shade(@selected_bg_color, 1.1);
    background-image: none;
    color: @theme_selected_fg_color;
}

.selection-mode.header-bar .suggested-action.button:hover,
.selection-mode.toolbar .suggested-action.button:hover,
.selection-mode.toolbar GtkToolButton.suggested-action .button:hover {
    background-color: shade(@selected_bg_color, 1.20);
    background-image: none;
}

.selection-mode.header-bar .suggested-action.button:active,
.selection-mode.toolbar .suggested-action.button:active,
.selection-mode.toolbar GtkToolButton.suggested-action:active {
    background-color: shade(@theme_selected_bg_color, 1.3);
    background-image: none;
}

/* menu button */
.selection-mode.header-bar .selection-menu.button,
.selection-mode.toolbar .selection-menu.button {
    border-style: none;
    background-color: transparent;
    background-image: none;
    color: shade(@selected_bg_color, 0.6);
}

.selection-mode.toolbar .dim-label,
.selection-mode.toolbar .selection-menu.button .dim-label {
    color: shade(@selected_bg_color, 0.7);
}

.selection-mode.header-bar .selection-menu.button:hover,
.selection-mode.toolbar .dim-label:hover,
.selection-mode.toolbar .selection-menu.button:hover,
.selection-mode.toolbar .selection-menu.button .dim-label:hover {
    color: shade(@selected_bg_color, 0.7);
}

.selection-mode.header-bar .selection-menu.button:active,
.selection-mode.toolbar .selection-menu.button:active {
    color: shade(@selected_bg_color, 0.8);
    box-shadow: none;
}
  '';
}
