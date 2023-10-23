{ config, lib, pkgs, uservars, ... }:
{
  imports = [
    ./metacity-theme-1-xml.nix
    ./metacity-theme-2-xml.nix
    ./metacity-theme-3-xml.nix
    ./metacity-theme-xml.nix
  ];
home.file.".themes/dynamic-color-theme/metacity-1/close_focused_normal.png".source = ./. + "/close_focused_normal.png";
home.file.".themes/dynamic-color-theme/metacity-1/close_focused.png".source = ./. + "/close_focused.png";
home.file.".themes/dynamic-color-theme/metacity-1/close_focused_prelight.png".source = ./. + "/close_focused_prelight.png";
home.file.".themes/dynamic-color-theme/metacity-1/close_focused_pressed.png".source = ./. + "/close_focused_pressed.png";
home.file.".themes/dynamic-color-theme/metacity-1/close.png".source = ./. + "/close.png";
home.file.".themes/dynamic-color-theme/metacity-1/close_unfocused.png".source = ./. + "/close_unfocused.png";
home.file.".themes/dynamic-color-theme/metacity-1/close_unfocused_prelight.png".source = ./. + "/close_unfocused_prelight.png";
home.file.".themes/dynamic-color-theme/metacity-1/close_unfocused_pressed.png".source = ./. + "/close_unfocused_pressed.png";
home.file.".themes/dynamic-color-theme/metacity-1/maximize_focused_normal.png".source = ./. + "/maximize_focused_normal.png";
home.file.".themes/dynamic-color-theme/metacity-1/maximize_focused.png".source = ./. + "/maximize_focused.png";
home.file.".themes/dynamic-color-theme/metacity-1/maximize_focused_prelight.png".source = ./. + "/maximize_focused_prelight.png";
home.file.".themes/dynamic-color-theme/metacity-1/maximize_focused_pressed.png".source = ./. + "/maximize_focused_pressed.png";
home.file.".themes/dynamic-color-theme/metacity-1/maximize.png".source = ./. + "/maximize.png";
home.file.".themes/dynamic-color-theme/metacity-1/maximize_unfocused.png".source = ./. + "/maximize_unfocused.png";
home.file.".themes/dynamic-color-theme/metacity-1/maximize_unfocused_prelight.png".source = ./. + "/maximize_unfocused_prelight.png";
home.file.".themes/dynamic-color-theme/metacity-1/maximize_unfocused_pressed.png".source = ./. + "/maximize_unfocused_pressed.png";
home.file.".themes/dynamic-color-theme/metacity-1/menu_focused_normal.png".source = ./. + "/menu_focused_normal.png";
home.file.".themes/dynamic-color-theme/metacity-1/menu_focused.png".source = ./. + "/menu_focused.png";
home.file.".themes/dynamic-color-theme/metacity-1/menu_focused_prelight.png".source = ./. + "/menu_focused_prelight.png";
home.file.".themes/dynamic-color-theme/metacity-1/menu_focused_pressed.png".source = ./. + "/menu_focused_pressed.png";
home.file.".themes/dynamic-color-theme/metacity-1/menu.png".source = ./. + "/menu.png";
home.file.".themes/dynamic-color-theme/metacity-1/menu_unfocused.png".source = ./. + "/menu_unfocused.png";
home.file.".themes/dynamic-color-theme/metacity-1/menu_unfocused_prelight.png".source = ./. + "/menu_unfocused_prelight.png";
home.file.".themes/dynamic-color-theme/metacity-1/menu_unfocused_pressed.png".source = ./. + "/menu_unfocused_pressed.png";
home.file.".themes/dynamic-color-theme/metacity-1/minimize_focused_normal.png".source = ./. + "/minimize_focused_normal.png";
home.file.".themes/dynamic-color-theme/metacity-1/minimize_focused.png".source = ./. + "/minimize_focused.png";
home.file.".themes/dynamic-color-theme/metacity-1/minimize_focused_prelight.png".source = ./. + "/minimize_focused_prelight.png";
home.file.".themes/dynamic-color-theme/metacity-1/minimize_focused_pressed.png".source = ./. + "/minimize_focused_pressed.png";
home.file.".themes/dynamic-color-theme/metacity-1/minimize.png".source = ./. + "/minimize.png";
home.file.".themes/dynamic-color-theme/metacity-1/minimize_unfocused.png".source = ./. + "/minimize_unfocused.png";
home.file.".themes/dynamic-color-theme/metacity-1/minimize_unfocused_prelight.png".source = ./. + "/minimize_unfocused_prelight.png";
home.file.".themes/dynamic-color-theme/metacity-1/minimize_unfocused_pressed.png".source = ./. + "/minimize_unfocused_pressed.png";
home.file.".themes/dynamic-color-theme/metacity-1/shade_focused_normal.png".source = ./. + "/shade_focused_normal.png";
home.file.".themes/dynamic-color-theme/metacity-1/shade_focused.png".source = ./. + "/shade_focused.png";
home.file.".themes/dynamic-color-theme/metacity-1/shade_focused_prelight.png".source = ./. + "/shade_focused_prelight.png";
home.file.".themes/dynamic-color-theme/metacity-1/shade_focused_pressed.png".source = ./. + "/shade_focused_pressed.png";
home.file.".themes/dynamic-color-theme/metacity-1/shade.png".source = ./. + "/shade.png";
home.file.".themes/dynamic-color-theme/metacity-1/shade_unfocused.png".source = ./. + "/shade_unfocused.png";
home.file.".themes/dynamic-color-theme/metacity-1/shade_unfocused_prelight.png".source = ./. + "/shade_unfocused_prelight.png";
home.file.".themes/dynamic-color-theme/metacity-1/shade_unfocused_pressed.png".source = ./. + "/shade_unfocused_pressed.png";
home.file.".themes/dynamic-color-theme/metacity-1/unmaximize_focused_normal.png".source = ./. + "/unmaximize_focused_normal.png";
home.file.".themes/dynamic-color-theme/metacity-1/unmaximize_focused.png".source = ./. + "/unmaximize_focused.png";
home.file.".themes/dynamic-color-theme/metacity-1/unmaximize_focused_prelight.png".source = ./. + "/unmaximize_focused_prelight.png";
home.file.".themes/dynamic-color-theme/metacity-1/unmaximize_focused_pressed.png".source = ./. + "/unmaximize_focused_pressed.png";
home.file.".themes/dynamic-color-theme/metacity-1/unmaximize.png".source = ./. + "/unmaximize.png";
home.file.".themes/dynamic-color-theme/metacity-1/unmaximize_unfocused.png".source = ./. + "/unmaximize_unfocused.png";
home.file.".themes/dynamic-color-theme/metacity-1/unmaximize_unfocused_prelight.png".source = ./. + "/unmaximize_unfocused_prelight.png";
home.file.".themes/dynamic-color-theme/metacity-1/unmaximize_unfocused_pressed.png".source = ./. + "/unmaximize_unfocused_pressed.png";
home.file.".themes/dynamic-color-theme/metacity-1/unshade_focused_normal.png".source = ./. + "/unshade_focused_normal.png";
home.file.".themes/dynamic-color-theme/metacity-1/unshade_focused.png".source = ./. + "/unshade_focused.png";
home.file.".themes/dynamic-color-theme/metacity-1/unshade_focused_prelight.png".source = ./. + "/unshade_focused_prelight.png";
home.file.".themes/dynamic-color-theme/metacity-1/unshade_focused_pressed.png".source = ./. + "/unshade_focused_pressed.png";
home.file.".themes/dynamic-color-theme/metacity-1/unshade.png".source = ./. + "/unshade.png";
home.file.".themes/dynamic-color-theme/metacity-1/unshade_unfocused.png".source = ./. + "/unshade_unfocused.png";
home.file.".themes/dynamic-color-theme/metacity-1/unshade_unfocused_prelight.png".source = ./. + "/unshade_unfocused_prelight.png";
home.file.".themes/dynamic-color-theme/metacity-1/unshade_unfocused_pressed.png".source = ./. + "/unshade_unfocused_pressed.png";

}