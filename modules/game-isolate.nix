# Reserve a set of CPU threads for a game while it runs.
#
# Usage: set `game-run` as the Lutris command prefix. While the game (and
# every process it leaves behind, e.g. wineserver) is alive, everything else
# is kept off `gameCpus`; afterwards all CPUs are free again.
#
# GAME_RUN_MODE=confined (default): the game runs only on `gameCpus`.
# GAME_RUN_MODE=reserved: the game may also use the shared CPUs.
#
# If the reservation is ever left behind: `systemctl stop game-isolate`.
{
  config,
  lib,
  pkgs,
  uservars,
  ...
}: let
  cfg = config.services.gameIsolate;
  systemctl = "${config.systemd.package}/bin/systemctl";
  userSlices = "app.slice session.slice background.slice work.slice";
  gameRun = pkgs.writeShellScriptBin "game-run" ''
    if [ $# -eq 0 ]; then
      echo "usage: game-run <command> [args...]" >&2
      exit 2
    fi
    unit="game-$$.scope"
    props=()
    if [ "''${GAME_RUN_MODE:-confined}" = confined ]; then
      props+=(-p "AllowedCPUs=${cfg.gameCpus}")
    fi

    release() {
      for s in ${userSlices}; do
        systemctl --user set-property --runtime "$s" AllowedCPUs=
      done
      systemctl stop game-isolate.service
    }
    trap release EXIT

    systemctl start game-isolate.service
    for s in ${userSlices}; do
      systemctl --user set-property --runtime "$s" "AllowedCPUs=${cfg.otherCpus}"
    done

    systemd-run --user --scope --quiet --collect --unit="$unit" \
      --slice=game.slice "''${props[@]}" -- "$@"
    rc=$?
    # the scope stays active until the last process in it (wineserver etc.) exits
    while systemctl --user is-active --quiet "$unit"; do
      sleep 2
    done
    exit $rc
  '';
in {
  options.services.gameIsolate = {
    enable = lib.mkEnableOption "reserving CPU threads for a running game";
    gameCpus = lib.mkOption {
      type = lib.types.str;
      example = "4-9";
      description = "CPU threads reserved for the game.";
    };
    otherCpus = lib.mkOption {
      type = lib.types.str;
      example = "0-3,10-19";
      description = "All remaining CPU threads; everything else runs here while a game is active.";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [gameRun];

    # the user manager needs the cpuset controller to restrict its own slices
    systemd.services."user@".serviceConfig.Delegate = "pids memory cpu cpuset io";

    systemd.user.slices.game.description = "Running game";

    # system-side half: keeps system services (nix builds, pipewire) off the game CPUs
    systemd.services.game-isolate = {
      description = "Keep system services off CPUs ${cfg.gameCpus} while a game runs";
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = "${systemctl} set-property --runtime system.slice AllowedCPUs=${cfg.otherCpus}";
        ExecStop = "${systemctl} set-property --runtime system.slice AllowedCPUs=";
      };
    };

    security.polkit.extraConfig = ''
      polkit.addRule(function(action, subject) {
        if (action.id == "org.freedesktop.systemd1.manage-units" &&
            action.lookup("unit") == "game-isolate.service" &&
            subject.user == "${uservars.name}") {
          return polkit.Result.YES;
        }
      });
    '';
  };
}
