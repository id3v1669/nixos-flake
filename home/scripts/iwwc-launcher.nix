{
  config,
  pkgs,
  writeShellApplication,
  envir,
  ...
}:
writeShellApplication {
  name = "iwwc-launcher";
  runtimeInputs = with pkgs; [
    iwwc
    procps
    coreutils
    (callPackage ./iwwc-ws.nix {inherit envir;})
    (callPackage ./iwwc-lang.nix {})
  ];
  text = ''
    set +o errexit
    set +o nounset
    set +o pipefail

    sock="''${XDG_RUNTIME_DIR:-/tmp}/iwwc.sock"

    # Exact-match pkill so this script (iwwc-launcher) never kills itself.
    pkill -x iwwc
    pkill -x iwwc-ws
    pkill -x iwwc-lang
    rm -f "$sock"

    iwwc daemon &

    # Wait for the daemon to bind its IPC socket instead of guessing with sleep.
    for _ in $(seq 100); do
      [ -S "$sock" ] && break
      sleep 0.1
    done

    iwwc open bar powerbuttons

    iwwc-ws &
    iwwc-lang &
  '';
}
