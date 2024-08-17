{ config
, pkgs
, writeShellApplication
, ...
}:
writeShellApplication{
  name = "eww-songname";
  runtimeInputs = with pkgs; [
    eww
    playerctl
  ];
  text = ''
set +o errexit
set +o nounset
set +o pipefail

playerctl --follow metadata --format '{{ artist }}-{{ title }}' | while read -r line; do
  cl=0
  res=""
  IFS=' ' read -r -a words <<< "$line"
  for word in "''${words[@]}"; do
    if ((cl + ''${#word} <= 40)); then
      cl=$((cl + ''${#word}))
      res="$res $word"
    else
      res="$res..."
      break
    fi
  done
  eww update songname="$res"
done
  '';
}