{ envir
, pkgs
, ...
}:
{
  home.file.".scripts/eww_volume.sh" = {
    executable = true;
    text = ''
#!/usr/bin/env bash

${pkgs.pulseaudio}/bin/pactl subscribe | ${pkgs.gnugrep}/bin/grep --line-buffered 'sink' | while read -r line; do
    default_sink=$(${pkgs.pulseaudio}/bin/pactl get-default-sink)
    ${pkgs.over-eww}/bin/eww update soundvol=$(${pkgs.pulseaudio}/bin/pactl get-sink-volume $default_sink | ${pkgs.gnugrep}/bin/grep -oP '\d+%' | head -1)
done
    '';
  };
}