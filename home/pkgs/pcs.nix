{ pkgs
, ...
}:
{
  home.packages = (with pkgs;[
    # screenshots
    grim                          # cli screenshot
    slurp                         # select area for screenshot

    # sound
    pamixer                       # cli mixer
    pavucontrol                   # gui mixer
    pulseaudio                    # just lib to use pactl, pipewire is in use
    helvum                        # gui for pipewire
    qpwgraph                      # gui for pipewire graph
    mpc-cli                       # cli for mpd
    qjackctl                      # gui for jack
    over-soundux                  # soundpad broken after webkitgtk update
    over-spotify                  # music player

    # vm, virt and emulators
    distrobox                     # archbox for apps that are not in nixpkgs
    docker-compose                # docker-compose for tests
    virtiofsd                     # virtiofsd for qemu

    # web
    networkmanagerapplet          # network manager applet
    nm-tray                       # network manager tray
    #over-tun2socks                # socks proxy for outline(shadowsocks)
    ungoogled-chromium            # backup browser
    wireguard-tools               # wireguard tools for experiments with vpn
    tor-browser                   # tor browser for research

    # vid photo etc
    vlc                           # video player
    mpv                           # video player
    nomacs                        # image viewer
    gnome.eog                     # image viewer
    ffmpegthumbnailer             # thumbnails for video files
    lutgen                        # image with filter generator
    swaybg                        # wallpapers
    hyprpaper                     # wallpapers
    imagemagickBig                # image manipulation(convert etc)
      
    # chat
    telegram-desktop              # telegram client
    whatsapp-for-linux            # whatsapp client
    over-vesktop                  # vesktop(unofficial discord app)
    arrpc                         # rpc for discord(vesktop)
      
    # security
    nmap                          # network scanner
    openssl                       # cli encryption
    #rustdesk                      # remote desktop

    # games
    protonup-qt                   # proton and wine updater
    steam                         # game launcher
    over-lutris                   # game launcher
    mangohud                      # overlay for games & apps

    # files
    cinnamon.nemo-with-extensions # file manager(as nautilus has incorrect behavior with gtk themes)
    zip                           # create .zip arcs
    p7zip                         # .7z arcs
    unzip                         # unzip .zip arcs
    file                          # file type detection
    rar                           # unfree for rar archives

    # text & docs
    libreoffice-qt                # opensource office apps
    hunspell                      # needed for libreoffice
    hunspellDicts.en_US-large     # needed for libreoffice
    hunspellDicts.ru_RU           # needed for libreoffice

    # other gui tools
    gnome.gnome-disk-utility      # disk manager(gparted is broken)
    qbittorrent                   # torrent client
    openrgb-with-all-plugins      # rgb control as nixos module is broken
    over-eww                      # overlay of eww(bar) with tray and dynamic tray icons
    isoimagewriter                # kde iso writer (as ventoy is bad for bios updated)

    # other cli utils
    over-hyprpicker               # color picker
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

    # libs
    gtk3                          # gtk lib
    libpng                        # png lib
    libnotify                     # for dunst or mako
    libheif                       # heif lib
    vulkan-headers                # vulkan lib
    vulkan-loader                 # vulkan lib

    # other
    dconf                         # settings for gnome apps
  ]);
}