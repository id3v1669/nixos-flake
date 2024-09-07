{ config
, pkgs
, writeShellApplication
, envir
, ...
}:
writeShellApplication{
  name = "eww-ws";
  runtimeInputs = with pkgs; [
    eww
    gnugrep
    socat
    gawk
  ] ++ lib.lists.optionals (envir == "Hyprland") [
    hyprland
  ];
  text = let
  wsa = if envir == "Hyprland" then ''
mapfile -t wsa < <(hyprctl workspaces | grep 'workspace ID .*(*)' | awk '{ gsub(/[()]/, "", $3); print $3 }')
  '' else '''';
  in ''
set +o errexit
set +o nounset
set +o pipefail

wss() {

  ws=("")
  ${wsa}
  curindex="$1"
  max=$(printf "%s\n" "''${wsa[@]}" | sort -n | tail -n 1)
  for (( counter=0; counter<max; counter++ )); do
    ws[counter]=""
  done
  for index2 in "''${wsa[@]}"; do
    ws[index2-1]=""
  done
  ws[curindex-1]=""
  eww update wss="''${ws[*]}"
}

wss

socat -u UNIX-CONNECT:/run/user/1000/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | \
stdbuf -o0 awk -F '>>|,' -e "/^workspace>>/ {print $2}" -e "/^focusedmon>>/ {print $3}" | \
while IFS= read -r line; do
    wss "$line"
done
  '';
}