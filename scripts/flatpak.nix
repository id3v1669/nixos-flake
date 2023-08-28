{ config, lib, pkgs, ... }:

{
  home.file.".scripts/flatpak.sh" = {
    executable = true;
    text = ''
#!/run/current-system/sw/bin/bash

declare -a apps=("com.spotify.Client"
                 "de.shorsh.discord-screenaudio"
                 "com.discordapp.Discord"
                 "net.lutris.Lutris"
                 "ch.tlaun.TL"
                 "net.cozic.joplin_desktop"
                 "org.libreoffice.LibreOffice"
                )

is_app_installed() {
    flatpak list --app | grep -q "$1"
}

for app in "''${apps[@]}"; do
  if ! is_app_installed "$app"; then
    flatpak install -y flathub "$app"
  fi
done

    '';
  };
}
