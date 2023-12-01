{ inputs, config, lib, pkgs, deflocale, uservars, hostname, brightnesctrl, ... }:
{
  imports = [ 
    (./. + "/hostsettings/${hostname}.nix")
    ./colors.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.over-hyprland;
    systemd.enable = true;
    xwayland.enable = true;
    settings = {
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgb(${config.colorScheme.colors.base0C}) rgb(${config.colorScheme.colors.base0B}) 45deg";
        "col.inactive_border" = "rgb(${config.colorScheme.colors.base01})";
        layout = "dwindle";
      };
      decoration = {
        rounding = 5;
      };
      animations = {
        enabled = true;
        bezier = "ease,0.4,0.02,0.21,1";
        animation = [
          "windows, 1, 3.5, ease, slide"
          "windowsOut, 1, 3.5, ease, slide"
          "border, 1, 6, default"
          "fade, 1, 3, ease"
          "workspaces, 1, 3.5, ease"
        ];
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
      "$mainMod" = "SUPER";
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
        "ALT, mouse:272, resizewindow"
      ];
      bind = [
        "$mainMod SHIFT, R, exec, rofi -show"
      ];
    };
    extraConfig = ''
#------------------env vars-----------------------
#exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
#exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland
#exec-once = dbus-update-activation-environment --systemd --all
#exec-once = systemctl --user start hyprland-session.target
#-------------------------------------------------

#exec-once = hyprctl setcursor Bibata-Modern-Classic 24
exec-once = arrpc &
exec-once = swhks &

exec-once = ${config.home.homeDirectory}/.scripts/wallpaper.sh

#----------------bar and applets------------------
exec-once = ${config.home.homeDirectory}/.scripts/ewwlauncher.sh
#------------------------------------------------- 

source = ${config.home.homeDirectory}/.config/hypr/colors

#------------------kitty for btop------------------
windowrule = float,^(kitty)$
windowrule = center,^(kitty)$
windowrule = size 1040 670,^(kitty)$
windowrule = opacity 0.8,^(kitty)
#--------------------------------------------------

#------------------screen sharing------------------
#exec-once = xwaylandvideobridge
windowrulev2 = opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$
windowrulev2 = noanim,class:^(xwaylandvideobridge)$
windowrulev2 = nofocus,class:^(xwaylandvideobridge)$
windowrulev2 = noinitialfocus,class:^(xwaylandvideobridge)$
#--------------------------------------------------

#--------------other windowrules-------------------
windowrule=float,^(pavucontrol)$
windowrule = opacity 0.8,^(pavucontrol)$

windowrule = float,^(nm-connection-editor)$
windowrule = opacity 0.8,^(nm-connection-editor)$

windowrule = float, blueman-manager
windowrule = opacity 0.8, blueman-manager
#--------------------------------------------------
    '';
  };
}
