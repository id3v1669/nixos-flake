{ ...
}:
{
  home.file.".scripts/moveeww.sh" = {
    executable = true;
    text = ''
#!/usr/bin/env bash

defaultscreen=$(eww get defaultscreen)

eww update defaultscreen=$((!$defaultscreen))

eww open popup-power-window --screen $((!$defaultscreen))
eww open calendar-popup-window --screen $((!$defaultscreen))
eww open bar --screen $((!$defaultscreen))

    '';
  };
}