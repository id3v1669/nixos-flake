# Reserve a set of CPU threads for a game while it runs.
#
# Usage: set `game-run` as the Lutris command prefix. While the game (and
# every process it leaves behind, e.g. wineserver) is alive, everything else
# is kept off `gameCpus`; afterwards all CPUs are free again.
#
# GAME_RUN_MODE=confined (default): the game runs only on `gameCpus`.
# GAME_RUN_MODE=reserved: the game may also use the shared CPUs.
#
# The reservation is released by a separate watcher unit once no game scope
# is left, so killing the wrapper or the launcher cannot leave it behind.
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
  # Runs as its own transient user unit, so the reservation is released even
  # if the launcher kills the wrapper. Waits until no game scope is left
  # (covers processes a game leaves behind and several games at once).
  gameRelease = pkgs.writeShellScript "game-release" ''
    active() {
      ${systemctl} --user list-units 'game-*.scope' --state=active --no-legend \
        | ${pkgs.gnugrep}/bin/grep -q .
    }
    # give the game scope up to 30s to appear
    for _ in $(${pkgs.coreutils}/bin/seq 30); do
      active && break
      ${pkgs.coreutils}/bin/sleep 1
    done
    while active; do
      ${pkgs.coreutils}/bin/sleep 2
    done
    for s in ${userSlices}; do
      ${systemctl} --user set-property --runtime "$s" AllowedCPUs=
    done
    ${systemctl} stop game-isolate.service
  '';
  gameRun = pkgs.writeShellScriptBin "game-run" ''
    if [ $# -eq 0 ]; then
      echo "usage: game-run <command> [args...]" >&2
      exit 2
    fi
    props=()
    if [ "''${GAME_RUN_MODE:-confined}" = confined ]; then
      props+=(-p "AllowedCPUs=${cfg.gameCpus}")
    fi

    systemctl start game-isolate.service
    for s in ${userSlices}; do
      systemctl --user set-property --runtime "$s" "AllowedCPUs=${cfg.otherCpus}"
    done
    systemd-run --user --quiet --collect --unit="game-release-$$" \
      --slice=background.slice ${gameRelease}

    exec systemd-run --user --scope --quiet --collect --unit="game-$$.scope" \
      --slice=game.slice "''${props[@]}" -- "$@"
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
