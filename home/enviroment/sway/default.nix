{ config, lib, pkgs, deflocale, hostname, brightnesctrl, ... }:
{
  imports = [
    (./. + "/hosts/${hostname}.nix")
  ];
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    systemd.enable = true;
    config = {
      startup = [
        { command = "${config.home.homeDirectory}/.scripts/ewwlauncher.sh"; always = true; }
        { command = "${config.home.homeDirectory}/.scripts/wallpaper.sh"; always = true; }
        { command = "arrpc &"; always = true; }
        { command = "swhks &"; always = true; }
      ];
      terminal = "alacritty";
      gaps.inner = 7;
      window = {
        border = 2;
        titlebar = false;
      };
      modifier = "Mod4";
      input."type:keyboard" = {
        xkb_layout = "${deflocale.kblayout}";
        xkb_variant = "${deflocale.kbvariant}";
        xkb_options = "${deflocale.kboption}";
        xkb_numlock = "enabled";
      };
      input."type:touchpad" = {
        accel_profile = "adaptive";
        pointer_accel = "0.3";
        dwt = "disabled";
        tap = "enabled";
        natural_scroll = "enabled";
        scroll_method = "two_finger";
      };
      keybindings = let
        mod = config.wayland.windowManager.sway.config.modifier;
      in {
        "${mod}+Shift+r" = "exec rofi -show";
      };
      colors = {
        background = "#${config.colorScheme.colors.base00}";
        focused = {
          background = "#${config.colorScheme.colors.base00}";
          border = "#${config.colorScheme.colors.base05}";
          childBorder = "#${config.colorScheme.colors.base05}";
          indicator = "#${config.colorScheme.colors.base03}";
          text = "#${config.colorScheme.colors.base01}";
        };
        unfocused = {
          background = "#${config.colorScheme.colors.base01}";
          border = "#${config.colorScheme.colors.base01}";
          childBorder = "#${config.colorScheme.colors.base01}";
          indicator = "#${config.colorScheme.colors.base03}";
          text = "#${config.colorScheme.colors.base06}";
        };
        urgent = {
          background = "#${config.colorScheme.colors.base04}";
          border = "#${config.colorScheme.colors.base01}";
          childBorder = "#${config.colorScheme.colors.base01}";
          indicator = "#${config.colorScheme.colors.base03}";
          text = "#${config.colorScheme.colors.base06}";
        };
        placeholder = {
          background = "#${config.colorScheme.colors.base04}";
          border = "#${config.colorScheme.colors.base01}";
          childBorder = "#${config.colorScheme.colors.base01}";
          indicator = "#${config.colorScheme.colors.base03}";
          text = "#${config.colorScheme.colors.base06}";
        };
      };
    };
    extraConfig = ''
      # touchpad gestures
      bindgesture swipe:3:right workspace prev
      bindgesture swipe:3:left workspace next
    '';
    swaynag = {
      enable = true;
      settings = {
        "<config>" = {
          edge = "bottom";
          font = "Dina 12";
        };
        green = {
          edge = "top";
          background = "00AA00";
          text = "FFFFFF";
          button-background = "00CC00";
          message-padding = 10;
        };
      };
    };
  };
}