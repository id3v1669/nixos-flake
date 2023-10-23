{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/apps/unity.css".text = ''
UnityDecoration {
    -UnityDecoration-extents: 28px 0px 0px 0px;
    -UnityDecoration-input-extents: 10px;

    -UnityDecoration-shadow-offset-x: 0px;
    -UnityDecoration-shadow-offset-y: 3px;
    -UnityDecoration-active-shadow-color: alpha(@dark_shadow, 0.75);
    -UnityDecoration-active-shadow-radius: 9px;
    -UnityDecoration-inactive-shadow-color: alpha(@dark_shadow, 0.5);
    -UnityDecoration-inactive-shadow-radius: 6px;

    -UnityDecoration-glow-size: 10px;
    -UnityDecoration-glow-color: @theme_selected_bg_color;

    -UnityDecoration-title-indent: 10px;
    -UnityDecoration-title-fade: 50px;
    -UnityDecoration-title-alignment: 0.0;
}

UnityDecoration.top {
    border: 1px solid @header_bg_color;
    border-bottom-width: 0;
    border-radius: 5px 5px 0 0;
    padding: 1px 8px 0 8px;
    background-color: @header_bg_color;
    color: @header_fg_color;
    text-shadow: none;
}

UnityDecoration.top:backdrop {
    border: 1px solid @header_bg_color;    
    border-bottom-width: 0;
    background-color: @header_bg_color;
    color: mix(@titlebar_fg_color, @titlebar_bg_color, 0.2);
}

UnityDecoration.left,
UnityDecoration.right,
UnityDecoration.bottom {
    background-color: @theme_bg_color;
}

UnityDecoration.left:backdrop,
UnityDecoration.right:backdrop,
UnityDecoration.bottom:backdrop {
    background-color: @theme_bg_color;
}

UnityPanelWidget,
.unity-panel {
    border-width: 0 0 0 0;
    border-style: solid;
    border-color: @panel_bg_color;
    background-color: @header_bg_color; /* the theme_bg_color of the dark theme */
    color: @theme_fg_color;
}

.unity-panel.menubar,
.unity-panel .menubar {
}

.unity-panel.menuitem,
.unity-panel .menuitem {
    border-width: 0 0 0 0;
    color: @panel_fg_color;
}

.unity-panel.menubar.menuitem:hover,
.unity-panel.menubar .menuitem *:hover {
    border-color: mix(@panel_bg_color, @panel_fg_color, 0.2);
    background-color: @selected_bg_color;
    background-image: none;
    color: shade(@panel_fg_color, 1.08);
}
  '';
}
