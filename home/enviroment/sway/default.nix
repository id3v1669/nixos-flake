{ config, lib, pkgs, deflocale, hostname, brightnesctrl, ... }:
{
  imports = [
    (./. + "/hosts/${hostname}.nix")
  ];
  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    config = {
      #bars = [{ command = "${config.home.homeDirectory}/.scripts/ewwlauncher.sh"; }];
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

        # "Ctrl+Right" = "workspace next";
        # "Ctrl+Left" = "workspace prev";

        # "${mod}+1" = "workspace number 1";
        # "${mod}+2" = "workspace number 2";
        # "${mod}+3" = "workspace number 3";
        # "${mod}+4" = "workspace number 4";
        # "${mod}+5" = "workspace number 5";
        # "${mod}+6" = "workspace number 6";
        # "${mod}+7" = "workspace number 7";
        # "${mod}+8" = "workspace number 8";
        # "${mod}+9" = "workspace number 9";
        # "${mod}+0" = "workspace number 10";

        # "${mod}+Shift+q" = "kill";
        # "${mod}+g" = "fullscreen toggle"; 

        # "Ctrl+Shift+1" = "move container to workspace number 1";
        # "Ctrl+Shift+2" = "move container to workspace number 2";
        # "Ctrl+Shift+3" = "move container to workspace number 3";
        # "Ctrl+Shift+4" = "move container to workspace number 4";
        # "Ctrl+Shift+5" = "move container to workspace number 5";
        # "Ctrl+Shift+6" = "move container to workspace number 6";
        # "Ctrl+Shift+7" = "move container to workspace number 7";
        # "Ctrl+Shift+8" = "move container to workspace number 8";
        # "Ctrl+Shift+9" = "move container to workspace number 9";
        # "Ctrl+Shift+0" = "move container to workspace number 10";
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