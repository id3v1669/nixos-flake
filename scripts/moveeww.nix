{ pkgs
, ...
}:
{
  home.file.".scripts/moveeww.sh" = {
    executable = true;
    text = ''
#!/usr/bin/env bash

defaultscreen=$(${pkgs.eww}/bin/eww get defaultscreen)

${pkgs.eww}/bin/eww update defaultscreen=$((!$defaultscreen))

${pkgs.eww}/bin/eww open popup-power-window --screen $((!$defaultscreen))
${pkgs.eww}/bin/eww open calendar-popup-window --screen $((!$defaultscreen))
${pkgs.eww}/bin/eww open bar --screen $((!$defaultscreen))

    '';
  };
}