{ config
, pkgs
, writeShellApplication
, envir
, ...
}:
writeShellApplication {
  name = "eww-launcher";
  runtimeInputs = with pkgs; [
    eww
    gnugrep
    alsa-utils
    (callPackage ./eww-ws.nix {envir = envir;})
    (callPackage ./eww-lang.nix {})
    (callPackage ./eww-volume.nix {})
    (callPackage ./eww-songname.nix {})
  ];
  text = ''
set +o errexit
set +o nounset
set +o pipefail

if [ "$(pidof eww)" ]; then
  pidof eww | xargs kill
fi

sleep 2
eww daemon
sleep 2
eww open popup-power-window
eww open calendar-popup-window
eww open bar
sleep 2
systemctl --user restart blueman-applet
eww update soundvol="$(amixer sget Master | grep -o "[0-9]*%" | head -1)"
eww-ws &
eww-volume &
eww-lang &
eww-songname &
  '';
}
