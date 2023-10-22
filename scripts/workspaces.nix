{ config, lib, pkgs, uservars, ... }:
{
  home.file.".scripts/eww_ws.sh" = {
    executable = true;
    text = ''
#!/run/current-system/sw/bin/bash

wss() {

  ws=("")
  wsa=($(hyprctl workspaces | grep 'workspace ID .*(*)' | awk '{ gsub(/[()]/, "", $3); print $3 }'))
  curindex=($(hyprctl activeworkspace | grep 'workspace ID .*(*)' | awk '{ gsub(/[()]/, "", $3); print $3 }'))
  max=$(printf "%s\n" "''${wsa[@]}" | sort -n | tail -n 1)
  for (( counter=0; counter<max; counter++ )); do
    ws[counter]=""
  done
  for index2 in "''${wsa[@]}"; do
    ws[index2-1]=""
  done
  ws[curindex-1]=""
}

wss
eww update wss="''${ws[*]}"
    '';
  };
}