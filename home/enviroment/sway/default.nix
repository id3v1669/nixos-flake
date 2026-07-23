{
  lib,
  config,
  deflocale,
  hostname,
  ...
}: let
  clp = config.palette;
in {
  imports = lib.optional (
    builtins.pathExists (./. + "/hostsettings/${hostname}.nix")
  ) (./. + "/hostsettings/${hostname}.nix");

  wayland.windowManager.sway = {
    enable = true;
    package = null;
    checkConfig = false;
    systemd.enable = true;
    config = {
      modifier = "Mod4";
      fonts = {names = ["0xProto"];};
      bars = [];
      window = {
        border = 2;
        titlebar = false;
        commands = [
          {
            criteria.app_id = "(?i)(gnome-disks|gparted|kitty|veracrypt|polkit-gnome-authentication-agent-1)";
            command = "floating enable, move position center";
          }
          {
            criteria.class = "(?i)(gnome-disks|gparted|kitty|veracrypt|polkit-gnome-authentication-agent-1)";
            command = "floating enable, move position center";
          }
          {
            criteria.app_id = "(?i)wlroots";
            command = "floating enable";
          }
          {
            criteria.app_id = "nm-connection-editor";
            command = "floating enable, resize set width 30 ppt height 65 ppt, move position 69 ppt 60 px";
          }
          {
            criteria.class = "nm-connection-editor";
            command = "floating enable, resize set width 30 ppt height 65 ppt, move position 69 ppt 60 px";
          }
          {
            criteria.app_id = "(?i)(blueman-manager|.blueman-manager-wrapped|com.saivert.pwvucontrol)";
            command = "floating enable, resize set width 37 ppt height 71 ppt, move position 62 ppt 60 px";
          }
          {
            criteria.class = "(?i)(blueman-manager|.blueman-manager-wrapped|com.saivert.pwvucontrol)";
            command = "floating enable, resize set width 37 ppt height 71 ppt, move position 62 ppt 60 px";
          }
          {
            criteria.title = "(?i)(choose (files|an image)|open (file(s)?|video|folder)|(image|video) file|save (as|image|video|file)|local file|file upload|new archive)";
            command = "floating enable, resize set width 35 ppt height 70 ppt, move position center";
          }
        ];
      };
      floating = {
        border = 2;
        titlebar = false;
      };
      gaps = {
        inner = 6;
        outer = 0;
      };
      colors = {
        background = "#${clp.base06.hex}";
        focused = {
          border = "#${clp.base16.hex}";
          childBorder = "#${clp.base16.hex}";
          background = "#${clp.base06.hex}";
          text = "#${clp.base01.hex}";
          indicator = "#${clp.base12.hex}";
        };
        focusedInactive = {
          border = "#${clp.base04.hex}";
          childBorder = "#${clp.base04.hex}";
          background = "#${clp.base06.hex}";
          text = "#${clp.base03.hex}";
          indicator = "#${clp.base04.hex}";
        };
        unfocused = {
          border = "#${clp.base04.hex}";
          childBorder = "#${clp.base04.hex}";
          background = "#${clp.base06.hex}";
          text = "#${clp.base03.hex}";
          indicator = "#${clp.base04.hex}";
        };
        urgent = {
          border = "#${clp.base08.hex}";
          childBorder = "#${clp.base08.hex}";
          background = "#${clp.base06.hex}";
          text = "#${clp.base01.hex}";
          indicator = "#${clp.base08.hex}";
        };
      };
      input = {
        "type:keyboard" = {
          xkb_layout = "${deflocale.kblayout}";
          xkb_variant = "${deflocale.kbvariant}";
          xkb_options = "${deflocale.kboption}";
        };
        "type:touchpad" = {
          natural_scroll = "enabled";
          tap = "enabled";
          click_method = "clickfinger";
          scroll_factor = "0.4";
        };
      };
      seat."*".xcursor_theme = ''"${config.gtk.cursorTheme.name}" ${toString config.gtk.cursorTheme.size}'';
      startup = [
        {
          command = "wallpaper-autostart";
          always = true;
        }
        {
          command = "iwwc-launcher";
          always = true;
        }
      ];
      # swhkdp backup
      keybindings = lib.mkForce {"Mod4+r" = "exec anyrun";};
      assigns."2" = [
        {app_id = "(?i)(equibop|discord|vesktop)";}
        {class = "(?i)(equibop|discord|vesktop)";}
      ];
    };
    extraConfig = ''
      bindgesture swipe:3:right workspace prev
      bindgesture swipe:3:left workspace next
      workspace 1 output DP-1 HDMI-A-1 DVI-I-1
      workspace 2 output DP-2 HDMI-A-1 DVI-I-1
      workspace 3 output DP-1 HDMI-A-1 DVI-I-1
      workspace 4 output DP-1 HDMI-A-1 DVI-I-1
      workspace 5 output DP-1 HDMI-A-1 DVI-I-1
      workspace 6 output DP-1 HDMI-A-1 DVI-I-1
      workspace 7 output DP-1 HDMI-A-1 DVI-I-1
      workspace 8 output DP-1 HDMI-A-1 DVI-I-1
      workspace 9 output DP-1 HDMI-A-1 DVI-I-1
      workspace 10 output eDP-1
    '';
  };
}
