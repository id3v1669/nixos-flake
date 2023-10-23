{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/apps/budgie.css".text = ''
.budgie-panel {
    border-bottom-color: transparent;
}

.max-budgie-panel {
    border: none;
    background-color: alpha(black, 0.5);
}

.budgie-panel *:active {
    background-color: transparent;
}

/* top panel */
.budgie-panel.top {
    border-top-color: transparent;
}

/* left panel */
.budgie-panel.left {
    border-left-color: transparent;
}

/* right panel */
.budgie-panel.right {
    border-right-color: transparent;
}

.budgie-panel .message-area {
    border-radius: 3px;
    border: none;
    font: bold;
    text-shadow: 1px 1px alpha(black, 0.3);
    background-color: alpha(black, 0.5);
    box-shadow: inset 0px -1px 0px 0px rgba(0,0,0,0.2),inset 0px 1px 0px 0px rgba(255,255,255,0.1);
}

.budgie-panel .menu-icon *,
.budgie-panel .message-area * {
    icon-shadow: 1px 1px alpha(black, 0.3);
}

.max-budgie-panel .message-area {
    box-shadow:none;
    background-color: transparent;
}

.budgie-panel * {
    icon-shadow: none;
}

.launcher * {
    icon-shadow: 1px 1px alpha(black, 0.3);
}

PanelToplevel {
    padding: 0px;
    background-color: @panel_bg_color;
    background-image: none;
    color: @panel_fg_color;
}

.dark .notif-title {
    color: @orange;
}
  '';
}
