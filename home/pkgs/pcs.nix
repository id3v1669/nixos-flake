{ pkgs
, stable
, ...
}:
{
  home.packages = (with pkgs;[
    # screenshots
    wayshot                       # cli screenshot
    slurp                         # select area for screenshot

    # sound
    pamixer                       # cli mixer
    pavucontrol                   # gui mixer
    pulseaudio                    # just lib to use pactl, pipewire is in use
    helvum                        # gui for pipewire
    qpwgraph                      # gui for pipewire graph
    mpc-cli                       # cli for mpd
    qjackctl                      # gui for jack

    # vm, virt and emulators
    distrobox
    remmina                       # remote desktop
    stable.vagrant                # venv dev tool
    packer                        

    # web
    networkmanagerapplet          # network manager applet
    nm-tray                       # network manager tray
    wireguard-tools               # wireguard tools for experiments with vpn
    tor-browser                   # tor browser for research

    # vid photo etc
    vlc                           # video player
    mpv                           # video player
    nomacs                        # image viewer
    eog                           # image viewer
    ffmpegthumbnailer             # thumbnails for video files
    lutgen                        # image with filter generator
    hyprpaper                     # wallpapers
    imagemagickBig                # image manipulation(convert etc)
    imv                           # wayland cli image viewer
    swappy                        # screenshot editor

    # chat
    whatsapp-for-linux            # whatsapp client

    # games
    protonup-qt                   # proton and wine updater
    over-lutris                   # game launcher
    mangohud                      # overlay for games & apps
    steam-tui                     # unofficial steam tui client in rust
    steam-run                     # fhs steam
    steamPackages.steamcmd        # steamcmd for testing

    # files
    filezilla                     # ftp client
    nautilus                      # file manager   
    nemo-with-extensions          # file manager(backup as nautilus had some glitches in previous updates)
    zip                           # create .zip arcs
    p7zip                         # .7z arcs
    unzip                         # unzip .zip arcs
    file                          # file type detection
    rar                           # unfree for rar archives

    # text & docs
    libreoffice                   # opensource office apps
    hunspell                      # needed for libreoffice
    hunspellDicts.en_US-large     # needed for libreoffice
    hunspellDicts.ru_RU           # needed for libreoffice

    # other gui tools
    piper                         # gui for mouse settings daemon
    gnome-disk-utility            # disk manager(gparted is broken)
    qbittorrent                   # torrent client
    isoimagewriter                # kde iso writer (as ventoy is bad for bios updated)

    # other cli utils
    ngrrram                       # practice fast typing
    hyprpicker                    # color picker
    onefetch                      # fetch for git repos
    pciutils                      # lspci
    usbutils                      # lsusb
    lshw                          # hardware info
    mesa-demos                    # vulkan demos
    i2c-tools                     # needed for ddcutil and other i2c utils
    ddcutil                       # brightness control
    appimage-run                  # appimage runner
    vulkan-tools                  # vulkan utils
    cargo-binutils                # rust tools
    xdg-utils                     # xdg-open and other xdg utils
    wl-clipboard                  # wayland clipboard
    cliphist                      # clipboard history
    
    # nix utils
    nix-prefetch-git              # git hash for nixpkgs
    nixpkgs-review                # review utility for nixpkgs

    # libs
    gtk3                          #
    gtk4                          #
    libpng                        # png lib
    libnotify                     # for dunst or mako
    libheif                       # heif lib
    vulkan-headers                # vulkan lib
    vulkan-loader                 # vulkan lib

    # other
    dconf                         # settings for gnome apps
  ]);
}