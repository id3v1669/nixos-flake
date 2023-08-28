{ config, lib, pkgs, ... }:

{
  home.file.".scripts/firstinstall.sh" = {
    executable = true;
    text = ''
#!/run/current-system/sw/bin/bash

/home/user/.scripts/flatpak.sh
/home/user/.scripts/distrobox.sh

    '';
  };
}