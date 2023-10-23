{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/widgets/separator.css".text = ''
/*************
 * separator *
 *************/
.sidebar.view.separator,
.view.separator,
.separator,
.sidebar .view.separator {
    color: @theme_bg_color;
}

.pane-separator,
.titlebar .pane-separator {
    background-color: transparent;
}
.maximized .titlebar .pane-separator {
    box-shadow: inset 0px 1px 0px 0px rgba(255,255,255,0.1);
    background-image: linear-gradient(to bottom,@header_bg_color,@header_bg_color);
}

.button .separator,
.button.separator {
    color: transparent;
}

.primary-toolbar GtkSeparatorToolItem,
.primary-toolbar .separator,
.primary-toolbar .separator:insensitive,
.toolbar GtkSeparatorToolItem,
.toolbar .separator,
.toolbar .separator:insensitive,
.header-bar GtkSeparatorToolItem,
.header-bar .separator,
.header-bar .separator:insensitive {
    border-color: shade(@toolbar_bg_color, 0.87);
    color: shade(@toolbar_bg_color, 0.87);
}

.primary-toolbar .button .separator,
.primary-toolbar .button.separator,
.toolbar .button .separator,
.toolbar .button.separator,
.header-bar .button .separator,
.header-bar .button.separator {
    border-color: shade(@toolbar_bg_color, 0.95);
}

.primary-toolbar .button .separator:insensitive,
.primary-toolbar .button.separator:insensitive,
.toolbar .button .separator:insensitive,
.toolbar .button.separator:insensitive,
.header-bar .button .separator:insensitive,
.header-bar .button.separator:insensitive {
    border-color: shade(@toolbar_bg_color, 0.85);
}

.menuitem.separator {
    -GtkMenuItem-horizontal-padding: 0;
    -GtkWidget-separator-height: 1;

    border-style: none;
    color: shade(@menu_bg_color, 0.9);
}

GtkComboBox .separator {
    border-style: none;

    /* always disable separators */
    -GtkWidget-wide-separators: true;
    -GtkWidget-horizontal-separator: 0;
    -GtkWidget-vertical-separator: 0;
}
  '';
}
