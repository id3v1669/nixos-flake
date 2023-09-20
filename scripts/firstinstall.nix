{ config, lib, pkgs, uservars, ... }:

{
  home.file.".scripts/firstinstall.sh" = {
    executable = true;
    text = ''
#!/run/current-system/sw/bin/bash

${config.home.homeDirectory}/.scripts/flatpak.sh
${config.home.homeDirectory}/.scripts/distrobox.sh

    '';
  };
}