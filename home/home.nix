{ hyprland, inputs, config, lib, pkgs, curversion, uservars, envir, hostname, colorsvar,  ... }:
{
  imports = [
    ./programs
    ./../scripts
    ./enviroment/qt
    ./enviroment/gnome
    ./enviroment/gtk
    inputs.nix-colors.homeManagerModules.default
  ]++ lib.lists.optionals (envir == "hypr") [
    ./enviroment/hyprland
    ./enviroment/rofi
    ./enviroment/eww
    ./enviroment/dunst
    ./enviroment/xdg
  ] ++ lib.lists.optionals (envir == "gnome") [
  ];
  colorScheme = inputs.nix-colors.colorSchemes.${colorsvar};
  home = {
    stateVersion = "${curversion}";
    username = "${uservars.name}";
    homeDirectory = "/home/${uservars.name}";
    packages = (with pkgs; [
      #screenshots
      grim
      slurp

      #sound
      pamixer
      pavucontrol
      pulseaudio #just lib to use pactl, pipewire is in use
      helvum
      qpwgraph #gui for pipewire graph
      mpc-cli
      qjackctl
      (callPackage ./custom/wineasio.nix {})

      #vm and virt
      virt-manager
      distrobox
      docker
      docker-compose
      egl-wayland

      #web
      curl
      wget
      wireshark
      nm-tray
      ungoogled-chromium

      #vid photo sound etc
      ffmpeg
      vlc
      nomacs
      gnome.eog
      hyprpicker #color picker
      ffmpegthumbnailer
      hyprpaper #walpapers

      #chat
      telegram-desktop
      whatsapp-for-linux

      #security
      openssl
      veracrypt

      #hw related
      bluez
      mesa
      mesa-demos

      #games
      steam
      
      (lutris.override {
        extraPkgs = pkgs: [
          giflib
          libpng
          #libldap #not found
          gnutls
          mpg123
          #libsForQt5.kpipewire
          #libpulseaudio
          #pulseaudio
          #pulseaudioFull
          #pipewire
          libgpg-error
          #alsa-plugins
          #alsa-lib
          libjpeg
          libgcrypt
          ocl-icd
          libxslt
          libva
          vulkan-loader
          gst_all_1.gst-plugins-base
          xorg.libXcomposite
          xorg.libXinerama
          #wine-staging
          wineWowPackages.staging
          wine64Packages.stagingFull
          openal
          v4l-utils
          sqlite
          ncurses
          xdg-desktop-portal
          jansson
        ];
      })

      #gui tools
      partition-manager
      qbittorrent
      gnome.nautilus
      rustdesk
      github-desktop
      joplin-desktop
      openrgb-with-all-plugins

      #cli tools
      vim
      pciutils
      usbutils
      lshw
      file
      btop
      neofetch
      git
      gh
      iwd
      zip
      unzip
      i2c-tools # needed for ddcutil
      ddcutil # brightness control
      appimage-run
      vulkan-tools
      wireguard-tools
      networkmanagerapplet
      cargo-binutils
      xdg-utils

      #nix utils
      nix-prefetch-git

      #other
      winetricks
      gtk3
      openjdk19
      libsForQt5.qt5.qtwayland
      libsForQt5.qt5ct
      qt6.qtwayland
      libnotify #for dunst or mako
      (callPackage ./custom/xwaylandvideobridge.nix {})
      #(callPackage ./custom/discord-scr.nix {})
      #(callPackage ./custom/rohrkabel.nix {})

      #temp
      dconf
      kitty
    ]) ++ lib.lists.optionals (envir == "gnome") (with pkgs;[
      gnomeExtensions.appindicator
      gnomeExtensions.notification-banner-reloaded
      gnomeExtensions.gsconnect
      gnomeExtensions.quick-settings-tweaker
      blackbox
    ]) ++ lib.lists.optionals (uservars.description == "alexp") (with pkgs;[
      yandex-browser
    ]) ++ lib.lists.optionals (uservars.description == "id3v1669") (with pkgs;[
      spotify
      krita
      gimp
    ]);
  };
}
