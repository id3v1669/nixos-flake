{
  config,
  pkgs,
  writeShellApplication,
  envir,
  ...
}:
writeShellApplication {
  name = "sp-play-pause";
  excludeShellChecks = ["SC2034"];
  runtimeInputs = with pkgs; [
    killall
    iwwc
    gawk
    pulseaudio
    coreutils
    gpu-screen-recorder
  ];
  text = ''
    set +o errexit
    set +o nounset
    set +o pipefail

    if [[ $(pidof gpu-screen-recorder) ]]; then
        killall -SIGINT gpu-screen-recorder
        iwwc update recstyle pill
        exit 0
    fi

    video_path="$HOME/Videos/ShadowPlay"

    mkdir -p "$video_path"
    output="$(pactl get-default-sink).monitor"
    input="$(pactl get-default-source)"
    iwwc update recstyle pillred
    gpu-screen-recorder -w portal -f 40 -a "$output|$input" -c mp4 -r 240 -o "$video_path"

    # gpu-screen-recorder runs in the foreground, so reaching here means it exited
    # (crash, or SIGINT from the branch above). Never leave the pill stuck red.
    iwwc update recstyle pill
  '';
}
