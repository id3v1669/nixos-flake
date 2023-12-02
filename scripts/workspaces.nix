{ config, lib, pkgs, uservars, envir, ... }:
{
  home.file.".scripts/eww_ws.sh" = {
    executable = true;
    text = let
      start = ''
#!/usr/bin/env bash

wss() {

  ws=("")
      '';
      env = if envir == "Hyprland" then ''
  wsa=($(hyprctl workspaces | grep 'workspace ID .*(*)' | awk '{ gsub(/[()]/, "", $3); print $3 }'))
  curindex=($(hyprctl activeworkspace | grep 'workspace ID .*(*)' | awk '{ gsub(/[()]/, "", $3); print $3 }'))
      '' else  if envir == "sway" then ''
  wsa=($(swaymsg -t get_workspaces | grep -o '"num":\s*[0-9]\+' | awk '{print $2}'))
  curindex=($(swaymsg -t get_workspaces -p | grep "focused" | awk '{print $2}'))
      '' else '''';
      end = ''
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
      in
        start + env + end;
  };
}