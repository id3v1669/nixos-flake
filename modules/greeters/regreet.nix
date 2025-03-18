{
  pkgs,
  lib,
  uservars,
  colorsvar,
  ...
}: let
  inherit (lib) getExe getExe';
in {
  services.greetd = with pkgs; let
    greetdHyprlandConfig = writeText "greetd-hyprland-config" ''
      source=/etc/hypr/monitor-init.conf

      animations {
        enabled=false
        first_launch_animation=false
      }
      misc {
        disable_hyprland_logo=true
        disable_hyprland_qtutils_check=true
      }

      exec-once = hyprctl setcursor "Capitaine Cursors (Gruvbox)" 30
      exec-once = ${getExe' dbus "dbus-update-activation-environment"} --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE

      exec-once = ${getExe greetd.regreet} && ${
        getExe' hyprland "hyprctl"
      } exit
    '';
  in {
    settings = {
      default_session = {
        command = "${
          getExe hyprland
        } --config ${greetdHyprlandConfig} > /tmp/hyprland-log-out.txt 2>&1";
        user = "greeter";
      };
    };

    restart = false;
  };
  programs.regreet = {
    enable = true;
    theme = {
      #      package = pkgs.dynamic-color-gtk-theme;
      name = "Dynamic-Color-GTK-Theme";
    };
    cursorTheme = {
      package = pkgs.capitaine-cursors-themed;
      name = "Capitaine Cursors (Gruvbox)";
    };
    font = {
      package = pkgs._0xproto;
      name = "0xProto 13";
    };
    iconTheme = {
      package = pkgs.gruvbox-plus-icons;
      name = "Gruvbox-Plus-Dark";
    };
    settings = {
      background = {
        fit = "Cover";
        path = "/etc/backgrounds/${colorsvar}/${uservars.wp}";
      };
      GTK = {
        application_prefer_dark_theme = true;
      };
    };
  };
}
