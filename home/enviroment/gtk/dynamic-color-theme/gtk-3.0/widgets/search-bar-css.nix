{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/widgets/search-bar.css".text = ''
/***************
 * search bars *
 ***************/
.search-bar.primary-toolbar,
.search-bar.toolbar,
.search-bar {
    padding: 7px;
    background-color: @theme_bg_color;
    color: @theme_fg_color;
    border:none;
}

.search-bar GtkSearchEntry,
.search-bar GtkSearchEntry:focus,
.search-bar.primary-toolbar GtkSearchEntry,
.search-bar.primary-toolbar GtkSearchEntry:focus {
    border-radius: 5px;
    border-color:transparent;
}

.search-bar .button.close-button {
    padding: 4px;
}

.search-bar.toolbar .button {
    border: none;
    background: none;
    color: @theme_fg_color;
}

.search-bar.toolbar .button:hover,
.search-bar.toolbar .button:active:hover,
.search-bar.toolbar .button:checked:checked {
    background: none;
    color: @selected_bg_color;
}
  '';
}
