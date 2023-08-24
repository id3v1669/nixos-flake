{hyprland, config, lib, pkgs, ...}:
{
  imports = [
    ./programs
  ];
  home = {
    stateVersion = "23.05";
    username = "user";
    homeDirectory = "/home/user";
  };

  home.packages = (with pkgs; [
    #screenshots
    grim
    slurp

    #sound
    pamixer

    #vm and virt
    virt-manager
    distrobox
    docker
    docker-compose

    #web
    curl
    wget
    wireshark
    nm-tray

    #vid photo sound etc
    krita
    spotify
    ffmpeg
    vlc
    mpc-cli
    pamixer

    #chat
    telegram-desktop
    whatsapp-for-linux

    #utils
    partition-manager
    pciutils
    usbutils
    lshw
    file
    gnome.nautilus
    rustdesk
    veracrypt
    btop
    neofetch
    git
    gh
    github-desktop
    iwd

    #hw related
    bluez
    mesa
    mesa-demos

    #games
    steam

    #other
    openjdk19

    #temp
    git
    kitty
    wofi
  ]);
}
