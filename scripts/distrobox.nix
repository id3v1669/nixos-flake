{ config, lib, pkgs, ... }:

{
  home.file.".scripts/distrobox.sh" = {
    executable = true;
    text = ''
#!/run/current-system/sw/bin/bash


does_distrobox_exist() {
    distrobox-list | grep -q "$1"
}

echo "Checking for distrobox images..."

if does_distrobox_exist "archbox"; then
  echo "archbox already exists"
else
  echo "archbox does not exist, creating..."
  distrobox-create --name archbox --image quay.io/toolbx-images/archlinux-toolbox
  distrobox enter --name archbox -- sudo pacman -S --noconfirm git make gcc
  mkdir ~/.tmpscript
  cd ~/.tmpscript
  git clone https://aur.archlinux.org/yay.git
  cd yay
  distrobox enter --name archbox -- makepkg -si --noconfirm
  rm -rf ~/.tmpscript
  distrobox enter --name archbox -- yay -Syyuu --noconfirm
fi

if does_distrobox_exist "debbox"; then
  echo "debbox already exists"
else
  echo "debbox does not exist, creating..."
  distrobox-create --name debbox --image quay.io/toolbx-images/debian-toolbox:12 
fi

    '';
  };
}