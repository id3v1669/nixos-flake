{
  config,
  pkgs,
  writeShellApplication,
  envir,
  ...
}:
writeShellApplication {
  name = "iwwc-ws";
  # awk field refs ($2/$3) must stay single-quoted so bash leaves them alone.
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
    ];
  text = let
    wsa =
      if envir == "Hyprland"
      then ''
        mapfile -t wsa < <(hyprctl workspaces | grep 'workspace ID .*(*)' | awk '{ gsub(/[()]/, "", $3); print $3 }')
      ''
      else ''echo "none"'';
    # Seed the first render with the workspace that is actually focused;
    # calling wss with no argument leaves curindex empty and corrupts ws[-1].
    initws =
      if envir == "Hyprland"
      then ''$(hyprctl activeworkspace | awk 'NR==1 { gsub(/[()]/, "", $3); print $3 }')''
      else "1";
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
      iwwc update wss "''${ws[*]}"
    }

    wss "${initws}"

    socat -u UNIX-CONNECT:"$XDG_RUNTIME_DIR"/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | \
    stdbuf -o0 awk -F '>>|,' -e '/^workspace>>/ {print $2}' -e '/^focusedmon>>/ {print $3}' | \
    while IFS= read -r line; do
        wss "$line"
    done
  '';
}
