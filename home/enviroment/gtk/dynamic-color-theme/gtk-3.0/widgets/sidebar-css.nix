{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/widgets/sidebar.css".text = ''
/***********
 * sidebar *
 ***********/
.sidebar,
.sidebar.view,
.sidebar .view,
.sidebar GtkScrolledWindow {
    background-color: @base_color;
    background-image: linear-gradient(to bottom,@base_color,@base_color);
    color: @text_color;
    transition: all .3s ease-in;
}

.sidebar GtkScrolledWindow,
.sidebar {
    border-width: 0;
    transition: all .3s ease-in;
}

.sidebar .image:selected:focus,
.sidebar .image:selected:hover {
    background-color: shade(@selected_bg_color,0.9);
    color: @selected_fg_color;
}

.sidebar  .list-row {
    /*background-color: @base_color;*/
    color: @text_color;
    border: 0px;
    transition: all .1s ease-in;


}
.sidebar  .list-row:selected{
  background-color: transparent;
  /*border-left: 3px  solid @selected_bg_color;*/
  color: @selected_bg_color;
  font-weight: bold;
  /*padding-left: 10px;*/
}
.sidebar .list-row:hover{
    background-color: shade(@base_color,0.9);
}
.sidebar .cell:selected,
.sidebar .cell:selected:focus {
    background-color: shade(@selected_bg_color,0.9);
    background-image: none;
    color: @selected_fg_color;
}

.sidebar GtkScrolledWindow .list-row {
    background-color: @header_bg_color;
    color: @header_fg_color;
}

.sidebar .frame {
    border-width: 0;
    background-color: @header_bg_color;

}

/*elementary os file manager*/
.sidebar .source-list{
    background: @header_bg_color;
    color: @header_fg_color;
    padding: 4px 0px;
}
.sidebar .source-list.view:not(:selected):hover{
    background-color: rgba(30, 31, 41, 0.4);
}

/* -------------
NEW ON GTK 3.18
---------------*/
GtkSidebarRow.list-row {
  padding: 0px;
  text-align: center;
}
GtkSidebarRow .sidebar-revealer {
  padding: 5px 14px 1px 12px; }
  GtkSidebarRow .sidebar-revealer:selected {
    color: red;}
GtkSidebarRow .sidebar-icon:dir(ltr) {
  padding-right: 8px; }
GtkSidebarRow .sidebar-icon:dir(rtl) {
  padding-left: 8px; }
GtkSidebarRow .sidebar-label:dir(ltr) {
  padding-right: 2px; }
GtkSidebarRow .sidebar-label:dir(rtl) {
  padding-left: 2px; }
  '';
}
