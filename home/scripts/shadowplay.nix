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
    gpu-screen-recorder
  ];
  text = ''
set +o errexit
set +o nounset
set +o pipefail

if [[ $(pidof gpu-screen-recorder) ]]; then
    killall -SIGINT gpu-screen-recorder
    eww update recclass="replay inactive"
    exit 0
fi

video_path="$HOME/Videos/ShadowPlay"

mkdir -p "$video_path"
output="$(pactl get-default-sink).monitor"
input="$(pactl get-default-source)"
eww update recclass="replay active"
gpu-screen-recorder -w portal -f 40 -a "$output|$input" -c mp4 -r 240 -o "$video_path"
  '';
}
