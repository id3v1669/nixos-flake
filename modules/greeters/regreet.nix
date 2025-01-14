{ pkgs
, lib
, inputs
, ...
}:
let 
  inherit (lib) getExe getExe';
in
{
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
      getExe' hyprland-unwrapped "hyprctl"
    } exit
  '';
  in {
    settings = {
      default_session = {
        command = "${
          getExe hyprland-unwrapped
        } --config ${greetdHyprlandConfig} > /tmp/hyprland-log-out.txt 2>&1";
        user = "greeter";
      };
    };

    restart = false;
  };
}
