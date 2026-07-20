{
  config,
  pkgs,
  writeShellApplication,
  ...
}:
writeShellApplication {
  name = "iwwc-lang";
  excludeShellChecks = ["SC2016"];
  runtimeInputs = with pkgs; [
    iwwc
    socat
    gawk
    coreutils
  ];
  text = ''
    set +o errexit
    set +o nounset
    set +o pipefail

    socat -u UNIX-CONNECT:"$XDG_RUNTIME_DIR"/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | \
    stdbuf -o0 awk -F '>>|,' -e '/^activelayout>>/ {print tolower(substr($3, 1, 2))}' | \
    while IFS= read -r line; do
      iwwc update lang "󰇧 $line"
    done
  '';
}
