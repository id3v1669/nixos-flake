{
  config,
  pkgs,
  writeShellApplication,
  envir,
  ...
}:
writeShellApplication {
  name = "iwwc-lang";
  excludeShellChecks = ["SC2016"];
  runtimeInputs = with pkgs;
    [
      iwwc
      socat
      gawk
      coreutils
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
    listen =
      if envir == "sway"
      then ''
        swaymsg -t subscribe -m '["input"]' | \
        jq --unbuffered -r 'select(.change == "xkb_layout") | .input.xkb_active_layout_name[0:2] | ascii_downcase' | \
      ''
      else if envir == "mango"
      then ''
        mmsg watch keyboardlayout | \
        jq --unbuffered -r '.layout[0:2] | ascii_downcase' | \
      ''
      else ''
        socat -u UNIX-CONNECT:"$XDG_RUNTIME_DIR"/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | \
        stdbuf -o0 awk -F '>>|,' -e '/^activelayout>>/ {print tolower(substr($3, 1, 2))}' | \
      '';
  in ''
    set +o errexit
    set +o nounset
    set +o pipefail

    ${listen}while IFS= read -r line; do
      iwwc update lang "󰇧 $line"
    done
  '';
}
