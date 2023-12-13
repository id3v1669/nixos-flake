{ config
, ...
}:
{
  home.file.".scripts/firstinstall.sh" = {
    executable = true;
    text = ''
#!/usr/bin/env bash

${config.home.homeDirectory}/.scripts/flatpak.sh
${config.home.homeDirectory}/.scripts/distrobox.sh

    '';
  };
}