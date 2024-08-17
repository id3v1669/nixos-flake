{ config
, pkgs
, writeShellApplication
, ...
}:
writeShellApplication{
  name = "eww-move";
  runtimeInputs = [ pkgs.eww ];
  text = ''
set +o errexit
set +o nounset
set +o pipefail

defaultscreen=$(eww get defaultscreen)

eww update defaultscreen=$((!defaultscreen))

eww open popup-power-window --screen $((!defaultscreen))
eww open calendar-popup-window --screen $((!defaultscreen))
eww open bar --screen $((!defaultscreen))

  '';
}