{ lib
, config
, pkgs
, deflocale
, hostname
, colorsvar
, uservars
, ...
}:
let
  clp = config.palette;
in
{
  imports = [] ++ lib.optional (
    builtins.pathExists (./. + "/hostsettings/${hostname}.nix")
    ) (./. + "/hostsettings/${hostname}.nix");

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    settings = {
      decoration.rounding = 5;
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgb(${clp.base16.hex}) rgb(${clp.base12.hex}) 45deg";
        "col.inactive_border" = "rgb(${clp.base04.hex})";
        layout = "dwindle";
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
        focus_on_close = 1;
        touchpad = {
            natural_scroll = true;
        };
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
      };
      misc = {
        disable_hyprland_logo = false;
        vrr = 0;
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      "$mainMod" = "SUPER";
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
        "ALT, mouse:272, resizewindow"
      ];
      bind = [
        "$mainMod, R, exec, anyrun"
      ];
    };
    extraConfig = ''
#----------------startup commands-----------------
exec-once = hyprctl setcursor "Capitaine Cursors (Gruvbox)" 30    # set cursor as hyprland doesn't respect gtk
exec-once = swhks &                                               # used command as systemd service starts it in isolation
#-------------------------------------------------

#-----------------startup scripts-----------------
exec-once = eww-launcher                                          # eww launcher
exec-once = wallpaper-autostart                                   # lutgen and wallpaper starter
#------------------------------------------------- 

#source = ${config.home.homeDirectory}/.config/hypr/colors

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
windowrule=float,^(org.pulseaudio.pavucontrol)$                   # sound controls
windowrule = opacity 0.8,^(org.pulseaudio.pavucontrol)$           # sound controls

windowrule = float,^(nm-connection-editor)$                       # network manager
windowrule = opacity 0.8,^(nm-connection-editor)$                 # network manager

windowrule = float, blueman-manager                               # bluetooth manager
windowrule = opacity 0.8, blueman-manager                         # bluetooth manager
windowrule = float, .blueman-manager-wrapped                      # bluetooth manager
windowrule = opacity 0.8, .blueman-manager-wrapped                # bluetooth manager
#--------------------------------------------------

#--------------other windowrules2------------------
windowrulev2 = opacity 0.95 0.9,class:^(Spotify)$                 # spotify
windowrulev2 = opacity 0.95 0.95,class:^(floorp)$                 # floorp
windowrulev2 = opacity 0.95 0.85,class:^(Alacritty)$              # terminal
#windowrulev2 = opacity 0.95 0.9,class:^(nemo)$                   # file manager
windowrulev2 = opacity 0.95 0.9,class:^(code-url-handler)$        # vscode1
windowrulev2 = opacity 0.95 0.9,class:^(Code)$                    # vscode2
windowrulev2 = opacity 0.95 0.9,class:^(org.telegram.desktop)$    # telegram
#Polkit
windowrulev2 = float, class:(polkit-gnome-authentication-agent-1)
windowrulev2 = center, class:(polkit-gnome-authentication-agent-1)
#Discord client
windowrulev2 = opacity 0.95 0.9,class:^(equibop)$
windowrulev2 = workspace 2, class:(equibop)
#--------------------------------------------------
    '';
  };

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = /etc/backgrounds/${colorsvar}/${uservars.wp}
    wallpaper = , /etc/backgrounds/${colorsvar}/${uservars.wp}
  '';
}
