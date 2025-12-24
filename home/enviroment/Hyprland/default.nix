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
  imports = lib.optional (
    builtins.pathExists (./. + "/hostsettings/${hostname}.nix")
  ) (./. + "/hostsettings/${hostname}.nix");

  home.packages = with pkgs; [
    hyprland-qt-support
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    settings = {
      decoration = {
        rounding = 4;
        blur.enabled = true;
        shadow.enabled = false;
      };
      general = {
        gaps_in = 3;
        gaps_out = 6;
        border_size = 2;
        "col.active_border" = "rgb(${clp.base16.hex}) rgb(${clp.base12.hex}) 45deg";
        "col.inactive_border" = "rgb(${clp.base04.hex})";
        layout = "dwindle";
      };
      animations = {
        enabled = true;
        bezier = "ease,0.4,0.02,0.21,1";
        animation = [
          "windows, 1, 1.5, ease, slide"
          "windowsOut, 1, 1.5, ease, slide"
          "border, 1, 6, default"
          "fade, 1, 3, ease"
          "workspaces, 1, 1.5, ease"
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
          scroll_factor = 0.4;
          clickfinger_behavior = true;
        };
      };
      # TODO: fix gestures for new hyprland version
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        vfr = true;
        vrr = 0;
        font_family = "0xProto";
        background_color = "0x282828";
        enable_anr_dialog = false;
      };
      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
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
      windowrule = opacity 0.0 override 0.0 override,class:(xwaylandvideobridge)
      windowrule = noanim,                class:(xwaylandvideobridge)
      windowrule = nofocus,               class:(xwaylandvideobridge)
      windowrule = noinitialfocus,        class:(xwaylandvideobridge)
      #--------------------------------------------------

      #-------------------file picker--------------------
      windowrule = tag +fileOperation,    title:((Choose (Files|an Image)|Open ([Ff]ile(s)?|[Ff]ile|Video|[Ff]older.*)|([Image|Video] File|Save (As|Image|Video|File)|Local File|File Upload))|New Archive)
      windowrule = float,                 tag:fileOperation
      windowrule = size 35% 70%,          tag:fileOperation
      windowrule = center,                tag:fileOperation
      #--------------------------------------------------

      #--------------other windowrules-------------------
      windowrule = tag +floatingCentered, class:(gnome-disks|GParted|[Kk]itty|[Vv]era[Cc]rypt|polkit-gnome-authentication-agent-1)
      windowrule = float,                 tag:floatingCentered
      windowrule = center,                tag:floatingCentered

      windowrule = opacity 0.95 0.9,      class:([Ss]potify|[Nn]emo|com.system76.CosmicFiles|code-url-handler|[Cc]ode|org.telegram.desktop|gnome-disks|GParted|Alacritty|[Kk]itty)

      windowrule = tag +floatOp,          class:(blueman-manager|.blueman-manager-wrapped|nm-connection-editor|org.pulseaudio.pavucontrol)
      windowrule = float,                 tag:floatOp
      windowrule = opacity 0.8,           tag:floatOp

      windowrule = opacity 0.95 0.95,     class:([Ff]loorp|[Ff]irefox)

      windowrule = workspace 2,           class:([Ee]quibop|[Dd]iscord|[Vv]esktop)

      device {
        name = apple-inc.-magic-trackpad-1
        sensitivity = 0.3
      }
    '';
  };

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = /etc/backgrounds/${colorsvar}/${uservars.wp}
    wallpaper = , /etc/backgrounds/${colorsvar}/${uservars.wp}
  '';
}
