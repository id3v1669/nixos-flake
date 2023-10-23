{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/widgets/switch.css".text = ''
/*************
 * GtkSwitch *
 *************/

GtkSwitch {
    -GtkSwitch-slider-width: 30;
    border: none;
    font: 1;
}

GtkSwitch.trough {
    background-color: transparent;
    background-repeat: no-repeat;
    background-position: 0 center;
    border-color: transparent;
    border-image: none;
    border-style: none;
    color: transparent;
    box-shadow: none;
    text-shadow: none;
}

GtkSwitch.trough:active {
    background-color: transparent;
}

GtkSwitch.slider {
    background-repeat: no-repeat;
    background-position: 0 center;
    background-color: transparent;
}
  '';
}
