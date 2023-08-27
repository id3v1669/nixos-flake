{ config, lib, pkgs, ... }:

{
  home.file.".scripts/flatpak.sh". = {
    executable = true;
    text = ''
#!/run/current-system/sw/bin/bash

# List of Flatpak apps you want to ensure are installed
declare -a apps=("com.spotify.Client"
                 "de.shorsh.discord-screenaudio"
                )

# Function to check if an app is installed
is_app_installed() {
    flatpak list --app | grep -q "$1"
}

# Loop through each app and check if it's installed
for app in "${apps[@]}"; do
    if is_app_installed "$app"; then
        echo "$app is already installed."
    else
        echo "$app is not installed. Installing now..."
        flatpak install -y flathub "$app"
    fi
done

    '';
  };
}
