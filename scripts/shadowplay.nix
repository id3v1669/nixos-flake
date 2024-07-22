{ envir
, pkgs
, ...
}:
{
  home.file.".scripts/play-pause.sh" = {
    executable = true;
    text = let
      start = ''
#!/usr/bin/env bash

if [[ $(pidof gpu-screen-recorder) ]]; then
    ${pkgs.killall}/bin/killall -SIGINT gpu-screen-recorder
    ${pkgs.over-eww}/bin/eww update recclass="replay inactive"
    exit 0
fi

id="1"
if [ -n "$1" ]; then
    id=$1
fi

video_path="$HOME/Videos/ShadowPlay"

mkdir -p "$video_path"
      '';
      env = if envir == "Hyprland" then ''
monitor=$(${pkgs.over-hyprland}/bin/hyprctl monitors | grep "ID $id" | ${pkgs.gawk}/bin/awk '{print $2}')
'' else ''
monitor="screen"
'';
      end = ''
output="$(pactl get-default-sink).monitor"
input="$(pactl get-default-source)"
${pkgs.over-eww}/bin/eww update recclass="replay active"
gpu-screen-recorder -w $monitor -f 40 -a "$output|$input" -c mp4 -r 240 -o "$video_path"
      '';
      in
        start + env + end;
  };
}
