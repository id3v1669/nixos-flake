{ config, lib, pkgs, ... }:
{
  home.file.".scripts/flatpak.sh" = {
    executable = true;
    text = ''
#!/usr/bin/env bash

declare -a apps=(R
                 "org.kde.krita"
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

# self: super: 
# {
#   qt5 = super.qt5 // {
#     qtwebengine = super.qt5.qtwebengine.overrideAttrs (oldAttrs: {
#       postPatch = oldAttrs.postPatch or "" + ''
#         echo "Forcing a rebuild"
#       '';
#     });
#   };
# }