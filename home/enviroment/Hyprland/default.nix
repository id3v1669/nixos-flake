{ config
, pkgs
, deflocale
, hostname
, colorsvar
, uservars
, ...
}:
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
        "col.active_border" = "rgb(${config.colorScheme.palette.base0C}) rgb(${config.colorScheme.palette.base0B}) 45deg";
        "col.inactive_border" = "rgb(${config.colorScheme.palette.base01})";
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
#----------------startup commands-----------------
exec-once = hyprctl setcursor "Capitaine Cursors (Gruvbox)" 15    # set cursor as hyprland doesn't respect gtk
exec-once = arrpc &                                               # rpc server for discord
exec-once = swhks &                                               # shortcut daemon
#-------------------------------------------------

#-----------------startup scripts-----------------
exec-once = ${config.home.homeDirectory}/.scripts/wallpaper.sh    # lutgen and wallpaper starter
exec-once = ${config.home.homeDirectory}/.scripts/ewwlauncher.sh  # eww restarter and applets
#------------------------------------------------- 

source = ${config.home.homeDirectory}/.config/hypr/colors
source = ${config.home.homeDirectory}/.config/hypr/test.conf

#------------------kitty for btop------------------
windowrule = float,^(kitty)$
windowrule = center,^(kitty)$
windowrule = size 1040 670,^(kitty)$
windowrule = opacity 0.8,^(kitty)$
#--------------------------------------------------

#------------------screen sharing------------------
#exec-once = xwaylandvideobridge
windowrulev2 = opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$
windowrulev2 = noanim,class:^(xwaylandvideobridge)$
windowrulev2 = nofocus,class:^(xwaylandvideobridge)$
windowrulev2 = noinitialfocus,class:^(xwaylandvideobridge)$
#--------------------------------------------------

#--------------other windowrules-------------------
windowrule=float,^(pavucontrol)$                                  # sound controls
windowrule = opacity 0.8,^(pavucontrol)$                          # sound controls

windowrule = float,^(nm-connection-editor)$                       # network manager
windowrule = opacity 0.8,^(nm-connection-editor)$                 # network manager

windowrule = float, blueman-manager                               # bluetooth manager
windowrule = opacity 0.8, blueman-manager                         # bluetooth manager
#--------------------------------------------------

#--------------other windowrules2------------------
windowrulev2 = opacity 0.95 0.9,class:^(Spotify)$                 # spotify
windowrulev2 = opacity 0.95 0.95,class:^(firefox)$                # firefox
windowrulev2 = opacity 0.95 0.85,class:^(Alacritty)$              # terminal
windowrulev2 = opacity 0.95 0.9,class:^(nemo)$                    # file manager
windowrulev2 = opacity 0.95 0.9,class:^(code-url-handler)$        # vscode1
windowrulev2 = opacity 0.95 0.9,class:^(Code)$                    # vscode2
windowrulev2 = opacity 0.95 0.9,class:^(org.telegram.desktop)$    # telegram
#Polkit
windowrulev2 = float, class:(polkit-gnome-authentication-agent-1)
windowrulev2 = center, class:(polkit-gnome-authentication-agent-1)
#Discord client
windowrulev2 = opacity 0.95 0.9,class:^(vesktop)$
windowrulev2 = workspace 2, class:(vesktop)
#--------------------------------------------------
    '';
  };

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${config.home.homeDirectory}/Pictures/Wallpapers/${colorsvar}/${uservars.wp}
    wallpaper = , ${config.home.homeDirectory}/Pictures/Wallpapers/${colorsvar}/${uservars.wp}
  '';
}
