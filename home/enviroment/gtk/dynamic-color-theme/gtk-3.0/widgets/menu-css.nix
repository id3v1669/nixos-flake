{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/widgets/menu.css".text = ''
/********
 * menu *
 ********/
GtkTreeMenu.menu,
GtkMenuToolButton.menu,
GtkComboBox .menu {
    background-color: @menu_bg_color;
    color: @menu_fg_color;
}

.primary-toolbar .menu,
.primary-toolbar .button .menu,
.toolbar .menu,
.toolbar .primary-toolbar .menu,
.header-bar .menu,
.header-bar .primary-toolbar .menu,
.menu {
    padding: 0;
    border-radius: 0;
    border-style: none;
    background-color: @menu_bg_color;
    color: @menu_fg_color;
}

.menu.button:hover,
.menu.button:active,
.menu.button:active *:insensitive,
.menu.button:insensitive,
.menu.button {
    border-width: 0;
    background-color: @menu_bg_color;
    background-image: none;
}

.context-menu {
    font: initial;
}

/***********
 * menubar *
 ***********/
.menubar {
    background-color: @menubar_bg_color;
    color: @menubar_fg_color;
}

/***************
 * menubaritem *
 ***************/
.menubar.menuitem,
.menubar .menuitem {
    padding: 3px 6px;
    color: @menubar_fg_color;
    border-width: 0px;
    border-bottom: 2px solid transparent;
}

.menubar.menuitem:hover,
.menubar .menuitem:hover {
    border-width: 0px;
    border-bottom: 2px solid @menu_selected_bg_color;
}

/************
 * menuitem *
 ************/
GtkTreeMenu .menuitem {
    color: @menu_fg_color;
    padding: 4px 6px;
    border-width: 0;
    background-color: @menu_bg_color;
}

.menuitem,
.menu .menuitem {
    padding: 4px 3px;
    border-width: 1px;
    border-style: solid;
    border-color: transparent;
    border-radius: 0;
    background-color: transparent;
    background-image: none;
    color: @menu_fg_color;

    -GtkMenuItem-arrow-scaling: 0.5;
}

.menu .menuitem:active,
.menu .menuitem:hover {
    transition: 100ms linear;
    border-style: none;
    background-color: @menu_selected_bg_color;
    border-radius: 0;
    color: @menu_selected_fg_color;
    background-image: none;
}

.menu .menuitem:hover,
.menu .menuitem *:hover {
    transition: 100ms linear;
    background-color: @menu_selected_bg_color;;
    color: @menu_selected_fg_color;
}

.menu .menuitem:insensitive,
.menu .menuitem *:insensitive {
    color: mix(@menu_fg_color, @menu_bg_color, 0.5);
}

.menuitem.check,
.menuitem.radio,
.menuitem.check:hover,
.menuitem.radio:hover,
.menuitem.check:insensitive,
.menuitem.radio:insensitive {
    border-style: none;
    background-color: transparent;
    background-image: none;
}

.menuitem.check:active,
.menuitem.radio:active {
    border-style: none;
    background-color: transparent;
}

.menuitem.arrow {
    color: alpha(@menu_fg_color, 0.6);
}

.menuitem GtkCalendar:inconsistent {
    color: mix(@menu_fg_color, @menu_bg_color, 0.5);
}

.menuitem GtkCalendar.button {
    border-style: none;
    background-color: transparent;
    background-image: none;
}

.menuitem .entry {
    border-color: shade(@menu_bg_color, 0.7);
    background-color: @menu_bg_color;
    background-image: none;
    color: @menu_fg_color;
}

.menuitem .entry:active,
.menuitem .entry:focus {
    border-color: shade(@menu_bg_color, 0.7);
}

.menuitem .accelerator {
    color: alpha(@menu_fg_color, 0.6);
}

.menuitem .accelerator:hover {
    color: alpha(@theme_base_color, 0.8);
}

.menuitem .accelerator:insensitive {
    color: alpha(mix(@menu_fg_color, @menu_bg_color, 0.5), 0.6);
}
  '';
}
