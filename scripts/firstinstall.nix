{ config, lib, pkgs, uservars, ... }:

{
  home.file.".scripts/firstinstall.sh" = {
    executable = true;
    text = ''
#!/run/current-system/sw/bin/bash

/home/${uservars.name}/.scripts/flatpak.sh
/home/${uservars.name}/.scripts/distrobox.sh

    '';
  };
}