{ config, lib, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    bind = [
      #screenshot
      "$mainMod SHIFT, 4, exec, grim -g '$(slurp)'"
      #toogle fullscreen
      "$mainMod, G, fullscreen,"
      #move focus
      "$mainMod,Tab,cyclenext,"
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"
      #switch workspaces
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
      #move app to workspace
      "CTRL SHIFT, 1, movetoworkspace, 1"
      "CTRL SHIFT, 2, movetoworkspace, 2"
      "CTRL SHIFT, 3, movetoworkspace, 3"
      "CTRL SHIFT, 4, movetoworkspace, 4"
      "CTRL SHIFT, 5, movetoworkspace, 5"
      "CTRL SHIFT, 6, movetoworkspace, 6"
      "CTRL SHIFT, 7, movetoworkspace, 7"
      "CTRL SHIFT, 8, movetoworkspace, 8"
      "CTRL SHIFT, 9, movetoworkspace, 9"
      "CTRL SHIFT, 0, movetoworkspace, 10"
      #launchers
      "$mainMod SHIFT, K, exec, kitty"
      "$mainMod SHIFT, T, exec, alacritty"
      "$mainMod SHIFT, B, exec, firefox"
      "$mainMod SHIFT, F, exec, nautilu"
      "$mainMod, W, exec, wofi --show drun"
      "$mainMod, R, exec, rofi -show"
      #other controls
      "$mainMod SHIFT, Q, killactive,"
      "$mainMod, M, exit,"
      "$mainMod, V, togglefloating,"
      "$mainMod, P, pseudo,"
      "$mainMod, J, togglesplit," 
    ];
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };
}