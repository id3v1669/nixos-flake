{ config, lib, pkgs, ... }:

{
  home.file.".scripts/firstinstall.sh" = {
    executable = true;
    text = ''
#!/run/current-system/sw/bin/bash

./flatpak.sh
./distrobox.sh

    '';
  };
}