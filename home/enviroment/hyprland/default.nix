{ inputs, config, lib, pkgs, deflocale, uservars, hostname, brightnesctrl, ... }:
{
  imports = [ 
    (./. + "/hostsettings/${hostname}.nix")
    (./. + "/usersettings/${uservars.description}.nix")
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


#----------------bar and applets------------------
exec-once = ${config.home.homeDirectory}/.scripts/ewwlauncher.sh
#------------------------------------------------- 

source = ${config.home.homeDirectory}/.config/hypr/colors
source = ${config.home.homeDirectory}/.config/hypr/test.conf

windowrule=float,^(pavucontrol)$
windowrule = opacity 0.8,^(pavucontrol)$

windowrule = float,^(nm-connection-editor)$
windowrule = opacity 0.8,^(nm-connection-editor)$

windowrule = float, blueman-manager
windowrule = opacity 0.8, blueman-manager


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
    
#------------------functional keys-----------------
bind =,XF86AudioMicMute,exec,pamixer --default-source -t
bind =,XF86MonBrightnessDown,exec,${brightnesctrl.down}
bind =,XF86MonBrightnessUp,exec,${brightnesctrl.up}
bind =,XF86AudioMute,exec,pamixer -t
bind =,XF86AudioLowerVolume,exec,pamixer -d 10 && eww update soundvol="$(amixer sget Master | grep -o "[0-9]*%" | head -1)"
bind =,XF86AudioRaiseVolume,exec,pamixer -i 10 && eww update soundvol="$(amixer sget Master | grep -o "[0-9]*%" | head -1)" 
bind =,XF86AudioPlay,exec,playerctl play-pause
bind =,XF86AudioPause,exec,playerctl play-pause
#--------------------------------------------------
    '';
  };
  home.file.".config/hypr/colors".text = ''
$background = rgb(${config.colorScheme.colors.base01})
$foreground = rgb(${config.colorScheme.colors.base06})

$color0 = rgb(${config.colorScheme.colors.base00})
$color1 = rgb(${config.colorScheme.colors.base01})
$color2 = rgb(${config.colorScheme.colors.base02})
$color3 = rgb(${config.colorScheme.colors.base03})
$color4 = rgb(${config.colorScheme.colors.base04})
$color5 = rgb(${config.colorScheme.colors.base05})
$color6 = rgb(${config.colorScheme.colors.base06})
$color7 = rgb(${config.colorScheme.colors.base07})
$color8 = rgb(${config.colorScheme.colors.base08})
$color9 = rgb(${config.colorScheme.colors.base09})
$color10 = rgb(${config.colorScheme.colors.base0A})
$color11 = rgb(${config.colorScheme.colors.base0B})
$color12 = rgb(${config.colorScheme.colors.base0C})
$color13 = rgb(${config.colorScheme.colors.base0D})
$color14 = rgb(${config.colorScheme.colors.base0E})
$color15 = rgb(${config.colorScheme.colors.base0F})
  '';
}
