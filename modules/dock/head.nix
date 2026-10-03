{pkgs, ...}: let
  mkSunshineConf = name: port: output:
    pkgs.writeText "sunshine-${name}.conf" ''
      sunshine_name = ${name}
      capture = wlr
      output_name = ${output}
      port = ${toString port}
      min_log_level = info
      # video-only dock: don't stream audio/create sink-sunshine-*
      stream_audio = disabled
      file_state = /home/user/.config/sunshine-${name}/state.json
      credentials_file = /home/user/.config/sunshine-${name}/creds.json
      file_apps = ${pkgs.writeText "sunshine-${name}-apps.json" (builtins.toJSON {
        env = {};
        apps = [
          {
            name = "Desktop";
            image-path = "desktop.png";
          }
        ];
      })}
      log_path = /home/user/.config/sunshine-${name}/sunshine.log
    '';

  dock-head = pkgs.writeShellApplication {
    name = "dock-head";
    runtimeInputs = [pkgs.hyprland pkgs.jq];
    text = ''
      # dock-head up|down|status
      # Creates/destroys the dock outputs; positions/modes are applied by
      # the monitor.lua home_dock preset reacting to monitor.added.
      # NB: writeShellApplication runs this under `set -euo pipefail`, so
      # every signature probe must tolerate a missing hypr dir / empty match
      # (at boot the graphical session doesn't exist yet) — hence `|| true`.

      # Discover the running Hyprland instance signature, set-e safe.
      find_sig() {
        if [ -z "''${HYPRLAND_INSTANCE_SIGNATURE:-}" ]; then
          local sig
          # shellcheck disable=SC2012
          sig=$(ls -1 "''${XDG_RUNTIME_DIR:-/run/user/$(id -u)}/hypr" 2>/dev/null | head -1 || true)
          [ -n "$sig" ] && export HYPRLAND_INSTANCE_SIGNATURE="$sig" || true
        fi
      }

      find_sig
      cmd="''${1:-status}"
      case "$cmd" in
        up)
          # Wait for Hyprland to be ready: on a msigf66 boot with the cable
          # already attached, the NM dispatcher fires this before the
          # graphical session exists. Poll up to ~90s.
          for _ in $(seq 1 90); do
            find_sig
            if hyprctl monitors >/dev/null 2>&1; then
              break
            fi
            sleep 1
          done
          hyprctl monitors >/dev/null 2>&1 || { echo "Hyprland not ready" >&2; exit 1; }
          hyprctl output create headless dock-1
          hyprctl output create headless dock-2
          ;;
        down)
          hyprctl output remove dock-1 || true
          hyprctl output remove dock-2 || true
          ;;
        status)
          hyprctl monitors -j | jq -r '.[] | "\(.name): \(.width)x\(.height)@\(.refreshRate) at \(.x),\(.y)"'
          ;;
        *)
          echo "usage: dock-head {up|down|status}" >&2
          exit 1
          ;;
      esac
    '';
  };
in {
  environment.systemPackages = [
    dock-head
    pkgs.sunshine
    pkgs.moonlight-qt
  ];
  systemd.user.services = let
    mkSunshineService = name: conf: {
      description = "Sunshine streamer (${name})";
      requires = ["dock-head.service"];
      after = ["dock-head.service"];
      serviceConfig = {
        ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p /home/user/.config/sunshine-${name}";
        ExecStart = "${pkgs.sunshine}/bin/sunshine ${conf}";
        Restart = "on-failure";
        RestartSec = 3;
      };
    };
  in {
    sunshine-dock1 = mkSunshineService "dock1" (mkSunshineConf "dock1" 47989 "dock-1");
    sunshine-dock2 = mkSunshineService "dock2" (mkSunshineConf "dock2" 48989 "dock-2");
    dock-head = {
      description = "Dock head: create virtual dock outputs";
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = "${dock-head}/bin/dock-head up";
        ExecStop = "${dock-head}/bin/dock-head down";
      };
      wants = ["sunshine-dock1.service" "sunshine-dock2.service"];
    };
  };

  networking.networkmanager.dispatcherScripts = [
    {
      type = "basic";
      source = pkgs.writeText "dock-dispatcher" ''
        [ "$1" = "enp5s0" ] || exit 0
        case "$2" in
          up)
            # --no-block: dock-head may wait up to 90s for Hyprland (boot
            # with cable attached); don't hang the dispatcher on it
            systemctl --user -M user@.host start --no-block dock-head.service || true
            ;;
          down)
            systemctl --user -M user@.host stop dock-head.service \
              sunshine-dock1.service sunshine-dock2.service || true
            ;;
        esac
      '';
    }
  ];
}
