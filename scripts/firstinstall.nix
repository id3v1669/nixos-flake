{ config, lib, pkgs, uservars, ... }:
{
  home.file.".scripts/firstinstall.sh" = {
    executable = true;
    text = ''
#!/run/current-system/sw/bin/bash

#
# {config.sops."myservice/my_subdir/my_secret"}
# {config.sops.secrets.example-key}

${config.home.homeDirectory}/.scripts/flatpak.sh
${config.home.homeDirectory}/.scripts/distrobox.sh

    '';
  };
}