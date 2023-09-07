{ config, lib, pkgs, deflocale, uservars, ... }:

{
  imports = [ 
    ./universal-env.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    xwayland.enable = true;
    settings = {
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(ff0084cc) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(f7add3cc)";
        layout = "dwindle";
        
      };
      decoration = {
        rounding = 5;
      };
      #bezier = "ease,0.4,0.02,0.21,1";
      #  animation = "windows, 1, 3.5, ease, slide";
      #  animation = "windowsOut, 1, 3.5, ease, slide";
      #  animation = "border, 1, 6, default";
      #  animation = "fade, 1, 3, ease";
      #  animation = "workspaces, 1, 3.5, ease";
      animations = {
        enabled = true;
        bezier = "ease,0.4,0.02,0.21,1";
        
      };
      input = {
        kb_layout = "${deflocale.kblayout}";
        kb_variant = "${deflocale.kbvariant}";
        kb_options = "${deflocale.kboption}";
        follow_mouse = 1;
        touchpad = {
            natural_scroll = true;
        };
        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
      };
      misc = {
        disable_hyprland_logo = false;
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master = {
        new_is_master = true;
      };
    };
    extraConfig =''
  # Fix slow startup
    #exec systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
    #exec dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
    exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

    exec-once = hyprctl setcursor Bibata-Modern-Classic 24
    #exec-once = dunst
    exec-once = waybar

    source = /home/${uservars.name}/.config/hypr/colors
#    exec = pkill waybar & sleep 0.5 && waybar
#    exec-once = swww init
#    exec = swww img /home/${uservars.name}/Imagens/wallpapers/menhera.jpg


#------------------screen sharing------------------
exec-once = xwaylandvideobridge
windowrulev2 = opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$
windowrulev2 = noanim,class:^(xwaylandvideobridge)$
windowrulev2 = nofocus,class:^(xwaylandvideobridge)$
windowrulev2 = noinitialfocus,class:^(xwaylandvideobridge)$
#------------------screen sharing------------------



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
    bind =,XF86MonBrightnessDown,exec,light -U 20
    bind =,XF86MonBrightnessUp,exec,light -A 20
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
  };
  home.file.".config/hypr/colors".text = ''
$background = rgba(1d192bee)
$foreground = rgba(c3dde7ee)

$color0 = rgba(1d192bee)
$color1 = rgba(465EA7ee)
$color2 = rgba(5A89B6ee)
$color3 = rgba(6296CAee)
$color4 = rgba(73B3D4ee)
$color5 = rgba(7BC7DDee)
$color6 = rgba(9CB4E3ee)
$color7 = rgba(c3dde7ee)
$color8 = rgba(889aa1ee)
$color9 = rgba(465EA7ee)
$color10 = rgba(5A89B6ee)
$color11 = rgba(6296CAee)
$color12 = rgba(73B3D4ee)
$color13 = rgba(7BC7DDee)
$color14 = rgba(9CB4E3ee)
$color15 = rgba(c3dde7ee)
  '';
}