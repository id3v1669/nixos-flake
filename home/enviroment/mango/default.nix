{
  lib,
  config,
  inputs,
  deflocale,
  hostname,
  ...
}: let
  clp = config.palette;
in {
  imports =
    [inputs.mango.hmModules.mango]
    ++ lib.optional (
      builtins.pathExists (./. + "/hostsettings/${hostname}.nix")
    ) (./. + "/hostsettings/${hostname}.nix");

  wayland.windowManager.mango = {
    enable = true;
    systemd = {
      enable = true;
      variables = [
        "DISPLAY"
        "WAYLAND_DISPLAY"
        "XDG_CURRENT_DESKTOP"
        "XDG_SESSION_TYPE"
        "NIXOS_OZONE_WL"
        "XCURSOR_THEME"
        "XCURSOR_SIZE"
        "MANGO_INSTANCE_SIGNATURE"
      ];
    };
    autostart_sh = ''
      wallpaper-autostart &
      iwwc-launcher &
    '';
    settings = {
      xkb_rules_layout = deflocale.kblayout;
      xkb_rules_variant = deflocale.kbvariant;
      xkb_rules_options = deflocale.kboption;

      trackpad_natural_scrolling = 1;
      tap_to_click = 1;
      click_method = 2;
      trackpad_scroll_factor = 0.4;

      warpcursor = 0;
      focus_cross_monitor = 1;

      borderpx = 2;
      gappih = 6;
      gappiv = 6;
      gappoh = 6;
      gappov = 6;
      rootcolor = "0x${clp.base06.hex}ff";
      bordercolor = "0x${clp.base04.hex}ff";
      focuscolor = "0x${clp.base16.hex}ff";
      urgentcolor = "0x${clp.base08.hex}ff";

      border_radius = 4;
      blur = 1;
      blur_optimized = 1;
      shadows = 0;

      animations = 1;
      animation_type_open = "slide";
      animation_type_close = "slide";
      animation_curve_open = "0.4,0.02,0.21,1";
      animation_curve_close = "0.4,0.02,0.21,1";
      animation_curve_tag = "0.4,0.02,0.21,1";
      animation_duration_open = 150;
      animation_duration_close = 150;
      animation_duration_tag = 150;
      animation_duration_move = 150;

      cursor_theme = config.gtk.cursorTheme.name;
      cursor_size = config.gtk.cursorTheme.size;

      dwindle_preserve_split = 1;
      tagrule = map (i: "id:${toString i},layout_name:dwindle") (lib.range 1 9);

      # swhkdp backup
      bind = [
        "SUPER,r,spawn,anyrun"
      ];
      mousebind = [
        "SUPER,btn_left,moveresize,curmove"
        "SUPER,btn_right,moveresize,curresize"
        "ALT,btn_left,moveresize,curresize"
      ];
      gesturebind = [
        "NONE,right,3,viewtoleft"
        "NONE,left,3,viewtoright"
      ];

      windowrule = [
        "isfloating:1,appid:(?i)(gnome-disks|gparted|kitty|veracrypt|polkit-gnome-authentication-agent-1)"
        "isfloating:1,appid:(?i)(wlroots)"
        "isfloating:1,width:0.3,height:0.65,offsetx:95,offsety:-70,focused_opacity:0.8,unfocused_opacity:0.8,appid:nm-connection-editor"
        "isfloating:1,width:0.37,height:0.71,offsetx:95,offsety:-70,focused_opacity:0.8,unfocused_opacity:0.8,appid:(?i)(blueman-manager|.blueman-manager-wrapped|com.saivert.pwvucontrol)"
        "isfloating:1,width:0.35,height:0.7,title:(?i)((choose (files|an image)|open (file(s)?|video|folder)|((image|video) file|save (as|image|video|file)|local file|file upload))|new archive)"
        "focused_opacity:0.95,unfocused_opacity:0.9,appid:(?i)(spotify|nemo|org.gnome.nautilus|com.system76.cosmicfiles|code-url-handler|code|org.telegram.desktop|gnome-disks|gparted|alacritty|kitty)"
        "focused_opacity:0.95,unfocused_opacity:0.95,appid:(?i)(floorp|firefox)"
        "tags:2,appid:(?i)(equibop|discord|vesktop)"
        "shield_when_capture:1,appid:(?i)(io.github.tobagin.karere|com.ayugram.desktop)"
        "shield_when_capture:1,title:(?i)(✳ Claude Code)"
        "noblur:1,focused_opacity:1,unfocused_opacity:1,appid:deadlocked"
      ];
    };
  };
}
