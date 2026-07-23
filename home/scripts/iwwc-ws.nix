{
  config,
  pkgs,
  writeShellApplication,
  envir,
  ...
}:
writeShellApplication {
  name = "iwwc-ws";
  excludeShellChecks = ["SC2016"];
  runtimeInputs = with pkgs;
    [
      iwwc
      gnugrep
      socat
      gawk
      coreutils
    ]
    ++ lib.lists.optionals (envir == "Hyprland") [
      hyprland
    ]
    ++ lib.lists.optionals (envir == "sway") [
      sway
      jq
    ]
    ++ lib.lists.optionals (envir == "mango") [
      mango
      jq
    ];
  text = let
    wsa =
      if envir == "Hyprland"
      then ''
        mapfile -t wsa < <(hyprctl workspaces | grep 'workspace ID .*(*)' | awk '{ gsub(/[()]/, "", $3); print $3 }')
      ''
      else if envir == "sway"
      then ''
        mapfile -t wsa < <(swaymsg -t get_workspaces | jq -r '.[].num')
      ''
      else if envir == "mango"
      then ''
        mapfile -t wsa < <(mmsg get all-tags | jq -r '[.all_tags[].tags[] | select(.client_count > 0).index] | unique | .[]')
      ''
      else ''wsa=()'';
    initws =
      if envir == "Hyprland"
      then ''$(hyprctl activeworkspace | awk 'NR==1 { gsub(/[()]/, "", $3); print $3 }')''
      else if envir == "sway"
      then ''$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused).num')''
      else if envir == "mango"
      then ''$(mmsg get all-tags | jq -r 'first(.all_tags[].tags[] | select(.is_active).index)')''
      else "1";
    listen =
      if envir == "Hyprland"
      then ''
        socat -u UNIX-CONNECT:"$XDG_RUNTIME_DIR"/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | \
        stdbuf -o0 awk -F '>>|,' -e '/^workspace>>/ {print $2}' -e '/^focusedmon>>/ {print $3}' | \
      ''
      else if envir == "sway"
      then ''
        swaymsg -t subscribe -m '["workspace"]' | \
        jq --unbuffered -r 'select(.change == "focus") | .current.num' | \
      ''
      else if envir == "mango"
      then ''
        mmsg watch all-tags | \
        jq --unbuffered -r 'first(.all_tags[].tags[] | select(.is_active).index)' | \
      ''
      else ''
        tail -f /dev/null | \
      '';
  in ''
    set +o errexit
    set +o nounset
    set +o pipefail

    wss() {

      ws=("")
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
      iwwc update wss "''${ws[*]}"
    }

    wss "${initws}"

    ${listen}while IFS= read -r line; do
        wss "$line"
    done
  '';
}
