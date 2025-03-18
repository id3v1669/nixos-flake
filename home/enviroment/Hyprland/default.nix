{
  lib,
  config,
  pkgs,
  deflocale,
  hostname,
  colorsvar,
  uservars,
  ...
}: let
  clp = config.palette;
in {
  imports =
    lib.optional (
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

      #------------------screen sharing------------------
      #exec-once = xwaylandvideobridge
      windowrulev2 = opacity 0.0 override 0.0 override,class:(xwaylandvideobridge)
      windowrulev2 = noanim,                class:(xwaylandvideobridge)
      windowrulev2 = nofocus,               class:(xwaylandvideobridge)
      windowrulev2 = noinitialfocus,        class:(xwaylandvideobridge)
      #--------------------------------------------------

      #-------------------file picker--------------------
      windowrulev2 = tag +fileOperation,    title:((Choose (Files|an Image)|Open ([Ff]ile(s)?|[Ff]ile|Video|[Ff]older.*)|([Image|Video] File|Save (As|Image|Video|File)|Local File|File Upload))|New Archive)
      windowrulev2 = float,                 tag:fileOperation
      windowrulev2 = size 35% 70%,          tag:fileOperation
      windowrulev2 = center,                tag:fileOperation
      #--------------------------------------------------

      #--------------other windowrules-------------------
      windowrulev2 = tag +floatingCentered, class:(gnome-disks|GParted|[Kk]itty|[Vv]era[Cc]rypt|polkit-gnome-authentication-agent-1)
      windowrulev2 = float,                 tag:floatingCentered
      windowrulev2 = center,                tag:floatingCentered

      windowrulev2 = opacity 0.95 0.9,      class:([Ss]potify|[Nn]emo|org.gnome.Nautilus|code-url-handler|[Cc]ode|org.telegram.desktop|[Ee]quibop|gnome-disks|GParted|Alacritty|[Kk]itty|[Dd]iscord|[Vv]esktop)

      windowrulev2 = tag +floatOp,          class:(blueman-manager|.blueman-manager-wrapped|nm-connection-editor|org.pulseaudio.pavucontrol)
      windowrulev2 = float,                 tag:floatOp
      windowrulev2 = opacity 0.8,           tag:floatOp

      windowrulev2 = opacity 0.95 0.95,     class:([Ff]loorp|[Ff]irefox)

      windowrulev2 = workspace 2,           class:([Ee]quibop|[Dd]iscord|[Vv]esktop)
    '';
  };

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = /etc/backgrounds/${colorsvar}/${uservars.wp}
    wallpaper = , /etc/backgrounds/${colorsvar}/${uservars.wp}
  '';
}
