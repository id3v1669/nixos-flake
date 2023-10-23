{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/apps/mate-applications.css".text = ''

/********
 * Caja *
 ********/

/* caja sidebar */
CajaWindow FMTreeView .view,
CajaWindow CajaNotesViewer .view,
CajaWindow CajaPlacesSidebar .view,
CajaWindow CajaHistorySidebar .view,
CajaWindow CajaInformationPanel GtkVBox,
CajaWindow CajaEmblemSidebar GtkViewport {
    background-color: @header_bg_color;
    color: @header_fg_color;
    border-width: 0px;
}
  '';
}
