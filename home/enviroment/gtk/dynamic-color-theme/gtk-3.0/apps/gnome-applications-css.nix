{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/apps/gnome-applications.css".text = ''
/************
 * nautilus *
 ************/
.nautilus-canvas-item {
    border-radius: 0px;
}

.nautilus-desktop.nautilus-canvas-item {
    color: white;
    text-shadow: 1px 1px alpha(black,0.8);
}

.nautilus-desktop.nautilus-canvas-item:active,
.nautilus-desktop.nautilus-canvas-item:prelight,
.nautilus-desktop.nautilus-canvas-item:selected {
    border-radius: 3px;
    text-shadow: none;
}

NautilusWindow.window-frame {
    background-color: transparent;
}

NautilusWindow.background {
    background-color: alpha(mix(@bg_color,@base_color,0.7),0.96);
}

NautilusWindow .sidebar,
NautilusWindow .sidebar .view {
    background-color: transparent;
    background-image: none;
}

NautilusWindow .sidebar .cell:selected,
NautilusWindow .sidebar .cell:selected:focus {
    border-radius: 0 3px 3px 0;
}

NautilusWindow .pane-separator.horizontal {
    background-image: none;
    border-right: 1px solid @bg_color;
}


NautilusListView GtkTreeView {
    border-color: @borders;
}

/******************
 * gnome terminal *
 ******************/
VteTerminal {
    background-color: @bg_color;
    color: @fg_color;
}

/*********
 * gedit *
 *********/
GeditViewFrame .gedit-search-slider {
    padding: 4px;
    border-radius: 0 0 0 5px;
    border: 0;
    background-color: @bg_color;
}

GeditViewFrame .gedit-search-slider .linked .button {
    border-color: alpha(black,0.2);
}

GeditViewFrame .gedit-search-slider .linked .button:hover {
    border-color: transparent;
    border-top-color: alpha(white,0.2);
    border-bottom-color: alpha(black,0.2);
}


GeditViewFrame .gedit-search-slider .not-found {
    background-color: @error_bg_color;
    background-image: none;
    color: @error_fg_color;
}

GeditViewFrame .gedit-search-slider .not-found:selected {
    background-color: @selected_bg_color;
    color: @selected_fg_color;
}

GdTaggedEntry *{
	color: @fg_color;
}

/**************
 * Tweak Tool *
 **************/
.tweak:hover{
    color: @text_color;
}

.tweak-categories .list-row.button:hover {
    background-color: @selected_bg_color;
    color: @selected_fg_color;
}

.tweak-categories {
    background-color: @base_color;
    background-image: linear-gradient(to bottom,@base_color,@base_color);
}

/**************
 * geary *
 **************/
.geary-titlebar-right GtkBox.left .button{

  background: transparent;
}
.geary-titlebar-right GtkBox.left .button:hover{

  background: transparent;
}
  '';
}
