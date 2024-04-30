{ pkgs
, ...
}:
{
  home.file.".scripts/moveeww.sh" = {
    executable = true;
    text = ''
#!/usr/bin/env bash

defaultscreen=$(${pkgs.over-eww}/bin/eww get defaultscreen)

${pkgs.over-eww}/bin/eww update defaultscreen=$((!$defaultscreen))

${pkgs.over-eww}/bin/eww open popup-power-window --screen $((!$defaultscreen))
${pkgs.over-eww}/bin/eww open calendar-popup-window --screen $((!$defaultscreen))
${pkgs.over-eww}/bin/eww open bar --screen $((!$defaultscreen))

    '';
  };
}