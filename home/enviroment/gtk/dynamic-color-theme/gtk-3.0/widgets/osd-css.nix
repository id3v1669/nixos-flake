{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/widgets/osd.css".text = ''
/*******
 * OSD *
 *******/
.background.osd {
    color: @osd_fg;
    background-color: @osd_bg;
}

.osd .view,
.osd.view {
    background-color: @osd_base;
}

.osd.button,
.osd .button {
    background-color: @osd_bg;
    background-image: none;
    color: @osd_fg;
}

.osd.toolbar {
    -GtkToolbar-button-relief: none;

    border: 1px solid shade(@osd_bg,0.8);
    border-radius: 4px;
    background-color: @osd_bg;
    background-image: none;
    color: @osd_fg;
}
  '';
}
