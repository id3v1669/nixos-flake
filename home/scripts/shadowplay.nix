{ config
, pkgs
, writeShellApplication
, envir
, ...
}:
writeShellApplication{
  name = "sp-play-pause";
  excludeShellChecks = [ "SC2034" ];
  runtimeInputs = with pkgs; [
    killall
    eww
    gawk
  ] ++ lib.lists.optionals (envir == "Hyprland") [
    hyprland
  ] ++ lib.lists.optionals (envir == "sway") [
    sway
  ];
  text = 
  let 
    monitor = if envir == "Hyprland" then ''
monitor=$(hyprctl monitors | grep "ID $id" | awk '{print $2}')
    '' else ''
monitor="screen"
    ''; # TODO: add sway support
  in ''
set +o errexit
set +o nounset
set +o pipefail

if [[ $(pidof gpu-screen-recorder) ]]; then
    killall -SIGINT gpu-screen-recorder
    eww update recclass="replay inactive"
    exit 0
fi

id="1"
if [ -n "$1" ]; then
    id=$1
fi

video_path="$HOME/Videos/ShadowPlay"

mkdir -p "$video_path"
${monitor}
output="$(pactl get-default-sink).monitor"
input="$(pactl get-default-source)"
eww update recclass="replay active"
gpu-screen-recorder -w "$monitor" -f 40 -a "$output|$input" -c mp4 -r 240 -o "$video_path"
  '';
}
