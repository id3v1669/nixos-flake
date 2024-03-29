{ envir
, pkgs
, ...
}:
{
  home.file.".scripts/volume.sh" = {
    executable = true;
    text = ''
#!/usr/bin/env bash

pactl subscribe | grep --line-buffered 'sink' | while read -r line; do
    default_sink=$(pactl get-default-sink)
    eww update soundvol=$(pactl get-sink-volume $default_sink | grep -oP '\d+%' | head -1)
done
    '';
  };
}