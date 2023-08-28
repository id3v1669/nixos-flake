{ config, lib, pkgs, ... }:

{
  home.file.".scripts/distrobox.sh" = {
    executable = true;
    text = ''
#!/run/current-system/sw/bin/bash


does_distrobox_exist() {
    distrobox-list | grep -q "$1"
}

if ! does_distrobox_exist "archbox"; then
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

if ! does_distrobox_exist "debbox"; then
  distrobox-create --name debbox --image quay.io/toolbx-images/debian-toolbox:12 
fi

    '';
  };
}