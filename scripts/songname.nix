{ envir
, pkgs
, ...
}:
{
  home.file.".scripts/eww_songname.sh" = {
    executable = true;
    text = ''
#!/usr/bin/env bash

${pkgs.playerctl}/bin/playerctl --follow metadata --format '{{ artist }}-{{ title }}' | \
while read -r line; do
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
    ${pkgs.eww}/bin/eww update songname="$res"
done
    '';
  };
}