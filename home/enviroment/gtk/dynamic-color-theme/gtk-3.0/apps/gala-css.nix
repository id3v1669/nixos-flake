{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/apps/gala.css".text = ''
/*******
* Gala *
*******/

.gala-notification {
    border: none;
    border-radius: 4px;
    background-color: transparent;
    background-image:
        linear-gradient(
            to bottom,
            @bg_color,
            @bg_color 80%,
            shade (
                @bg_color,
                0.94
            )
        );
    box-shadow:
        inset 0 0 0 1px alpha (@bg_highlight_color, 0.1),
        inset 0 1px 0 0 alpha (@bg_highlight_color, 0.9),
        inset 0 -1px 0 0 alpha (@bg_highlight_color, 0.3),
        0 0 0 1px alpha (#000, 0.2),
        0 3px 6px alpha (#000, 0.16),
        0 5px 5px -3px alpha (#000, 0.4);
}

.gala-notification .title,
.gala-notification .label {
    color: @text_color;
}

.gala-notification GtkImage {
    color: alpha (@text_color, 0.8);
}

.gala-button {
    padding: 3px;
    color: #fff;
    border: none;
    border-radius: 100px;
    background-image:
        linear-gradient(
            to bottom,
            #7e7e7e,
            #3e3e3e
        );
    box-shadow:
        inset 0 0 0 1px alpha (#fff, 0.02),
        inset 0 1px 0 0 alpha (#fff, 0.07),
        inset 0 -1px 0 0 alpha (#fff, 0.01),
        0 0 0 1px alpha (#000, 0.4),
        0 3px 6px alpha (#000, 0.16),
        0 3px 6px alpha (#000, 0.23);
    text-shadow: 0 1px 1px alpha (#000, 0.6);
}

/*********
 * Panel *
 ********/

 .panel {
    background-color: transparent;
    transition: all 100ms ease-in-out;
}

.panel.maximized {
    background-color: alpha(#000, 0);
}

.panel.translucent {
    background-color: alpha(#000, 0);
}

.composited-indicator > revealer label,
.composited-indicator > revealer image,
.composited-indicator > GtkRevealer {
    color: #fff;
    font-weight: bold;
    text-shadow:
        0 0 2px alpha (#000, 0.3),
        0 1px 2px alpha (#000, 0.6);
    icon-shadow:
        0 0 2px alpha (#000, 0.3),
        0 1px 2px alpha (#000, 0.6);
    transition: all 200ms ease-in-out;
}

.composited-indicator .keyboard {
    background-color: #fff;
    border-radius: 2px;
    box-shadow:
        0 0 2px alpha (#000, 0.3),
        0 1px 2px alpha (#000, 0.6);
    color: #333;
    font-weight: 600;
    padding: 0 3px;
    text-shadow: none;
}

.panel.color-light .composited-indicator > revealer label,
.panel.color-light .composited-indicator > revealer image,
.panel.color-light .composited-indicator > GtkRevealer {
    color: alpha (#000, 0.65);
    text-shadow:
        0 0 2px alpha (#fff, 0.3),
        0 1px 0 alpha (#fff, 0.25);
    icon-shadow:
        0 0 2px alpha (#fff, 0.3),
        0 1px 0 alpha (#fff, 0.25);
}

.panel.color-light .composited-indicator .keyboard {
    background-color: alpha (#000, 0);
    box-shadow:
        0 0 2px alpha (#fff, 0.3),
        0 1px 0 alpha (#fff, 0.25);
    color: #fff;
    text-shadow: none;
}

.panel .popover {
    box-shadow:
        inset 0 -1px 0 0 alpha (@bg_highlight_color, 0.5),
        0 3px 4px alpha (#000, 0.15),
        0 3px 3px -3px alpha (#000, 0.35);
}
  '';
}
