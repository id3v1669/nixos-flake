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

is_flathub_added() {
    flatpak remote-list | grep -q 'flathub'
}

echo "Checking if flathub is added..."

if is_flathub_added; then
  echo "Flathub repository is already added."
else
    echo "Flathub repository is not added. Adding now..."
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
fi

echo "Checking if flatpack apps are installed..."

for app in "''${apps[@]}"; do
  if is_app_installed "$app"; then
    echo "$app is already installed."
  else
    flatpak install -y flathub "$app"
  fi
done

    '';
  };
}