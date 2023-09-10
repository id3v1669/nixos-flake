{ config, lib, pkgs, ... }:
{
  extraConfig =''
    windowrule=float,^(kitty)$
    windowrule=float,^(pavucontrol)$
    windowrule=center,^(kitty)$
    windowrule=float,^(blueman-manager)$
    windowrule=size 1040 670,^(kitty)$
    windowrule=size 934 525,^(mpv)$
    windowrule=float,^(mpv)$
    windowrule=center,^(mpv)$
    #windowrule=pin,^(firefox)$

    $mainMod = SUPER
    bind = $mainMod, G, fullscreen,


    #bind = $mainMod, RETURN, exec, cool-retro-term-zsh
    bind = $mainMod SHIFT, K, exec, kitty
    bind = $mainMod SHIFT, T, exec, alacritty
    bind = $mainMod SHIFT, B, exec, firefox
    bind = $mainMod SHIFT, Q, killactive,
    bind = $mainMod, M, exit,
    bind = $mainMod SHIFT, F, exec, dolphin
    bind = $mainMod, V, togglefloating,
    bind = $mainMod, W, exec, wofi --show drun
    bind = $mainMod, R, exec, rofi -show
    bind = $mainMod, P, pseudo, # dwindle
    bind = $mainMod, J, togglesplit, # dwindle

    # Switch Keyboard Layouts
    bind = $mainMod, SPACE, exec, hyprctl switchxkblayout teclado-gamer-husky-blizzard next

    #bind = , Print, exec, grim -g "$(slurp)" - | wl-copy
    #bind = SHIFT, Print, exec, grim -g "$(slurp)"

    bind = $mainMod SHIFT, 4, exec, grim -g "$(slurp)"

    # Functional keybinds
    bind =,XF86AudioMicMute,exec,pamixer --default-source -t
    bind =,XF86MonBrightnessDown,exec,ddcutil setvcp 10 - 5
    bind =,XF86MonBrightnessUp,exec,ddcutil setvcp 10 + 5
    bind =,XF86AudioMute,exec,pamixer -t
    bind =,XF86AudioLowerVolume,exec,pamixer -d 10
    bind =,XF86AudioRaiseVolume,exec,pamixer -i 10
    bind =,XF86AudioPlay,exec,playerctl play-pause
    bind =,XF86AudioPause,exec,playerctl play-pause

    # to switch between windows in a floating workspace
    bind = SUPER,Tab,cyclenext,
    bind = SUPER,Tab,bringactivetotop,

    # Move focus with mainMod + arrow keys
    bind = $mainMod, left, movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up, movefocus, u
    bind = $mainMod, down, movefocus, d

    # Switch workspaces with mainMod + [0-9]
    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9
    bind = $mainMod, 0, workspace, 10

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    bind = CTRL SHIFT, 1, movetoworkspace, 1
    bind = CTRL SHIFT, 2, movetoworkspace, 2
    bind = CTRL SHIFT, 3, movetoworkspace, 3
    bind = CTRL SHIFT, 4, movetoworkspace, 4
    bind = CTRL SHIFT, 5, movetoworkspace, 5
    bind = CTRL SHIFT, 6, movetoworkspace, 6
    bind = CTRL SHIFT, 7, movetoworkspace, 7
    bind = CTRL SHIFT, 8, movetoworkspace, 8
    bind = CTRL SHIFT, 9, movetoworkspace, 9
    bind = CTRL SHIFT, 0, movetoworkspace, 10

    # Scroll through existing workspaces with mainMod + scroll
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow
    bindm = ALT, mouse:272, resizewindow
    '';
}