{ envir
, pkgs
, ...
}:
{
  home.file.".scripts/eww_lang.sh" = {
    executable = true;
    text = ''
#!/usr/bin/env bash

${pkgs.socat}/bin/socat -u UNIX-CONNECT:/run/user/1000/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | \
stdbuf -o0 ${pkgs.gawk}/bin/awk -F '>>|,' -e '/^activelayout>>/ {print tolower(substr($3, 1, 2))}' | \
while IFS= read -r line; do
    ${pkgs.eww}/bin/eww update langvar="$line"
done
    '';
  };
}

