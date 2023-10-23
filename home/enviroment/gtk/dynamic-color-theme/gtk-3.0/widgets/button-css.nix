{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/widgets/button.css".text = ''
/**********
 * button *
 **********/
.button {
    padding: 6px 8px;
    border-radius: 3px;
   /* border-width: 1px;
    border-style: solid;
    border-color: transparent;
    border-top-color: alpha(white,0.2);
    border-bottom-color: alpha(black,0.2);*/
    background-color: @base_color;
    background-image: none;
    color: @text_color;
    font: bold;

    -GtkWidget-focus-padding: 1;
    -GtkWidget-focus-line-width: 0;
}

.notebook .button,
.list .button,
.view .button {
    border-color: alpha(black,0.2);
}

.button:hover {
    border-color: transparent;
    border-top-color: alpha(white,0.2);
    border-bottom-color: alpha(black,0.2);
    background-color: @selected_bg_color;
    color: @selected_fg_color;
}

.button:active,
.button:active:hover,
.button:checked:checked {
    border-color: transparent;
    border-top-color: alpha(white,0.2);
    border-bottom-color: alpha(black,0.2);
    background-color: shade(@selected_bg_color, 0.9);
    color: @selected_fg_color;
}

.button:insensitive {
    background-color: mix(@bg_color,@base_color, 0.5);
    background-image: none;
}

/****************
* "flat" button *
*****************/
.button.flat,
.action-bar .button,
.inline-toolbar .button,
.osd .button,
.osd.button {
    border: none;
    background-color: transparent;
    background-image: none;
    color: @fg_color;
    font: bold;
}

.button.flat:hover,
.action-bar .button:hover,
.inline-toolbar .button:hover,
.action-bar .button:hover {
    border: none;
    transition: color 150ms ease-in;
    color: @selected_bg_color;
}

.button.flat:active,
.button.flat:active:focus,
.button.flat:checked,
.button.flat:active:checked,
.button.flat:active:checked:focus,
.action-bar .button:checked,
.action-bar .button:active {
    border: none;
    transition: color 150ms ease-in;
    color: shade(@selected_bg_color, 0.9);
    background-color: transparent;
}

.button.flat:active:hover {
    border: none;
    transition: color 150ms ease-in;
    color: @selected_bg_color;
    background-color: transparent;
}

/****************
* linked button *
*****************/
/* middle button */
.linked .entry,
.linked .button,
.linked .button:active,
.linked .button:active:hover,
.linked .button:focus,
.linked .button:focus:active,
.linked .button:insensitive,
.linked > GtkComboBox > .button:dir(ltr),
.linked > GtkComboBox > .button:dir(ltr):focus {
    border-radius: 0;
}


/* leftmost button */
.linked .entry:first-child,
.linked .button:first-child,
.linked .button:active:first-child,
.linked .button:active:hover:first-child,
.linked .button:focus:first-child,
.linked .button:focus:active:first-child,
.linked .button:insensitive:first-child,
.linked > GtkComboBox:first-child > .button,
.linked > GtkComboBox:first-child > .button:focus {
    border-right-width: 0;
    border-radius: 3px;
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
}

/* rightmost button */
.linked .entry:last-child,
.linked .button:last-child,
.linked .button:active:last-child,
.linked .button:active:hover:last-child,
.linked .button:focus:last-child,
.linked .button:focus:active:last-child,
.linked .button:insensitive:last-child,
.linked > GtkComboBox:last-child > .button,
.linked > GtkComboBox:last-child > .button:focus {
    border-left-width: 0;
    border-radius: 3px;
    border-bottom-left-radius: 0;
    border-top-left-radius: 0;
}

/* linked single button */
.linked .entry:only-child,
.linked .button:only-child,
.linked .button:active:only-child,
.linked .button:active:hover:only-child,
.linked .button:focus:only-child,
.linked .button:focus:active:only-child,
.linked .button:insensitive:only-child,
.linked.vertical > GtkComboBox:only-child > .button,
.linked.vertical > GtkComboBox:only-child > .button:focus {
    border-radius: 3px;
}

/* middle button (vertical) */
.linked.vertical .entry,
.linked.vertical .button,
.linked.vertical .button:active,
.linked.vertical .button:active:hover,
.linked.vertical .button:focus,
.linked.vertical .button:focus:active,
.linked.vertical .button:insensitive,
.linked.vertical > GtkComboBox > .button:dir(ltr),
.linked.vertical > GtkComboBox > .button:dir(ltr):focus {
    border-bottom-width: 0;
    border-radius: 0;
}

/* leftmost button (vertical) */
.linked.vertical .entry:first-child,
.linked.vertical .button:first-child,
.linked.vertical .button:active:first-child,
.linked.vertical .button:active:hover:first-child,
.linked.vertical .button:focus:first-child,
.linked.vertical .button:focus:active:first-child,
.linked.vertical .button:insensitive:first-child,
.linked.vertical > GtkComboBox:first-child > .button,
.linked.vertical > GtkComboBox:first-child > .button:focus {
    border-bottom-width: 0;
    border-radius: 3px;
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0;
}

/* rightmost button (vertical) */
.linked.vertical .entry:last-child,
.linked.vertical .button:last-child,
.linked.vertical .button:active:last-child,
.linked.vertical .button:active:hover:last-child,
.linked.vertical .button:focus:last-child,
.linked.vertical .button:focus:active:last-child,
.linked.vertical .button:insensitive:last-child,
.linked.vertical > GtkComboBox:last-child > .button,
.linked.vertical > GtkComboBox:last-child > .button:focus {
    border-radius: 3px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}

/* linked single button (vertical) */
.linked.vertical .entry:only-child,
.linked.vertical .button:only-child,
.linked.vertical .button:active:only-child,
.linked.vertical .button:active:hover:only-child,
.linked.vertical .button:focus:only-child,
.linked.vertical .button:focus:active:only-child,
.linked.vertical .button:insensitive:only-child,
.linked.vertical > GtkComboBox:only-child > .button,
.linked.vertical > GtkComboBox:only-child > .button:focus {
    border-radius: 3px;
}

.linked.vertical .entry:first-child {
    border: 1px solid alpha(black,0.2);
    border-bottom-width: 0px;
}

.linked.vertical .entry:last-child {
    border: 1px solid alpha(black,0.2);
}

/******************************
 * destructive action buttons *
 ******************************/
.destructive-action.button,
.titlebar .destructive-action.button {
    border-color: transparent;
    border-top-color: alpha(white,0.2);
    border-bottom-color: alpha(black,0.2);
    background-color: @error_color;
    color: @selected_fg_color;
}

.destructive-action.button:hover,
.titlebar .destructive-action.button:hover{
    background-color: @error_color;
    color: @selected_fg_color;
}

.destructive-action.button:active,
.titlebar .destructive-action.button:active {
    background-color: shade(@error_color,0.9);
    color: @selected_fg_color;
}

.destructive-action.button:hover:active,
.titlebar .destructive-action.button:hover:active {
    background-color: shade(@error_color,0.9);
    color: @selected_fg_color;
}

.destructive-action.button:insensitive,
.titlebar .destructive-action.button:insensitive {
    background-color: mix(@bg_color,@error,0.6);
}

/******************************
 * suggested action buttons *
 ******************************/
.suggested-action.button,
.list .suggested-action.button,
.titlebar .suggested-action.button {
    border-color: transparent;
    border-top-color: alpha(white,0.2);
    border-bottom-color: alpha(black,0.2);
    background-color: @cyan;
    color: @selected_fg_color;

}

.suggested-action.button:hover,
.list .suggested-action.button:hover,
.titlebar .suggested-action.button:hover{
    background-color: @cyan;
    color: @selected_fg_color;
}

.suggested-action.button:active,
.list .suggested-action.button:active,
.titlebar .suggested-action.button:active {
    background-color: shade(@cyan,0.9);
    color: @selected_fg_color;
}

.suggested-action.button:hover:active,
.list .suggested-action.button:hover:active,
.titlebar .suggested-action.button:hover:active {
    background-color: shade(@cyan,0.9);
    color: @selected_fg_color;
}

.suggested-action.button:insensitive,
.titlebar .suggested-action.button:insensitive {
    background-color: mix(@bg_color,@cyan,0.6);
}

/********************
 * circular buttons *
 ********************/
.circular-button.button {
    border: none;
    border-radius: 20px;
    outline-radius: 20px;
    box-shadow: inset 0px -1px 0px 0px rgba(0,0,0,0.2),inset 0px 1px 0px 0px rgba(255,255,255,0.2);
}
  '';
}
