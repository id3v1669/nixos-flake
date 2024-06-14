{ envir
, pkgs
, ...
}:
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
  wsa=($(${pkgs.over-hyprland}/bin/hyprctl workspaces | ${pkgs.gnugrep}/bin/grep 'workspace ID .*(*)' | ${pkgs.gawk}/bin/awk '{ gsub(/[()]/, "", $3); print $3 }'))
  '' else  if envir == "sway" then ''
  wsa=($(swaymsg -t get_workspaces | grep -o '"num":\s*[0-9]\+' | awk '{print $2}'))
      '' else '''';
      end = ''
    curindex="$1"
    max=$(printf "%s\n" "''${wsa[@]}" | sort -n | tail -n 1)
    for (( counter=0; counter<max; counter++ )); do
        ws[counter]=""
    done
    for index2 in "''${wsa[@]}"; do
        ws[index2-1]=""
    done
    ws[curindex-1]=""
    ${pkgs.over-eww}/bin/eww update wss="''${ws[*]}"
}

wss

${pkgs.socat}/bin/socat -u UNIX-CONNECT:/run/user/1000/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | \
stdbuf -o0 ${pkgs.gawk}/bin/awk -F '>>|,' -e '/^workspace>>/ {print $2}' -e '/^focusedmon>>/ {print $3}' | \
while IFS= read -r line; do
    wss "$line"
done
      '';
      in
        start + env + end;
  };
}