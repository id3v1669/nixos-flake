{ config
, pkgs
, writeShellApplication
, ...
}:
writeShellApplication{
  name = "eww-lang";
  excludeShellChecks = [ "SC2016" ];
  runtimeInputs = with pkgs; [
    eww
    socat
    gawk
  ];
  text = ''
set +o errexit
set +o nounset
set +o pipefail

socat -u UNIX-CONNECT:/run/user/1000/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | \
stdbuf -o0 awk -F '>>|,' -e '/^activelayout>>/ {print tolower(substr($3, 1, 2))}' | \
while IFS= read -r line; do
  eww update langvar="$line"
done
  '';# TODO: Add support for sway
}

