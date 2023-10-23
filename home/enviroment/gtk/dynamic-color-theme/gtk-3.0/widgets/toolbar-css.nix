{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/widgets/toolbar.css".text = ''
/***********
 * toolbar *
 ***********/
.toolbar {
    padding: 5px;
    border-style: none;
    background-color: @toolbar_bg_color;
    background-image: none;
}

/* primary-toolbar */
.primary-toolbar.toolbar {
    padding: 4px;
    background-color: @header_bg_color;
    color: @header_fg_color;
}

.primary-toolbar.toolbar .button {
    background-color: shade(@header_bg_color,1.2);
    color: @header_fg_color;
}

.primary-toolbar.toolbar .button:hover {
    background-color: @selected_bg_color;
    color: @selected_fg_color;
}

.primary-toolbar.toolbar .button:active,
.primary-toolbar.toolbar .button:checked {
    background-color: shade(@selected_bg_color,0.9);
}

.primary-toolbar.toolbar .button.flat {
    background-color: transparent;
}

.primary-toolbar.toolbar .button.flat:hover {
    color: @selected_bg_color;
}

.primary-toolbar.toolbar .button.flat:active,
.primary-toolbar.toolbar .button.flat:checked {
    color: shade(@selected_bg_color, 0.9);
}

/* inline-toolbar */
.inline-toolbar.toolbar {
    -GtkToolbar-button-relief: normal;

    padding: 4px;
    border-width: 1px;
    border-style: solid;
    border-color: @theme_bg_color;
    border-radius: 0;
    background-color: alpha(@theme_base_color,0.8);
    background-image: none;
}

.inline-toolbar.toolbar:last-child {
    border-width: 1px;
    border-color: @theme_bg_color;
    border-radius: 0;
}

.inline-toolbar.toolbar .separator {
    border-color: transparent;
}

.inline-toolbar.toolbar .button {
    background-color: transparent;
    padding: 2px;
}

.inline-toolbar.toolbar .button:hover,
.inline-toolbar.toolbar .button:active,
.inline-toolbar.toolbar .button:checked {
    color: @theme_selected_bg_color;
}
  '';
}
