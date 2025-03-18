{
  config,
  pkgs,
  writeShellApplication,
  ...
}:
writeShellApplication {
  name = "eww-volume";
  runtimeInputs = with pkgs; [
    eww
    gnugrep
    pulseaudio
  ];
  text = ''
    set +o errexit
    set +o nounset
    set +o pipefail

    pactl subscribe | grep --line-buffered 'sink' | while read -r _; do
      eww update soundvol="$(pactl get-sink-volume "$(pactl get-default-sink)" | grep -oP '\d+%' | head -1)"
    done
  '';
}
