{ hyprland, inputs, config, lib, pkgs, curversion, uservars, envir, hostname, colorsvar, gpuvar,  ... }:
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

      #vm, virt and emulators
      virt-manager
      distrobox
      #docker
      docker-compose

      #web
      curl
      wget
      wireshark
      nm-tray
      ungoogled-chromium
      wireguard-tools
      networkmanagerapplet
      iwd

      #vid photo etc
      ffmpeg
      vlc
      nomacs
      gnome.eog
      hyprpicker #color picker
      ffmpegthumbnailer
      hyprpaper #walpapers
      (callPackage ./custom/xwaylandvideobridge.nix {})

      #chat
      telegram-desktop
      whatsapp-for-linux

      #security
      openssl
      veracrypt

      #games
      steam
      (lutris.override {
        extraPkgs = pkgs: [
          giflib
          libpng
          openldap
          gnutls
          mpg123
          libgpg-error
          libjpeg
          libgcrypt
          ocl-icd
          libxslt
          vulkan-loader
          gst_all_1.gst-plugins-base
          xorg.libXcomposite
          xorg.libXinerama
          winetricks
          wine64Packages.stagingFull
          wineWowPackages.staging
          
          openal
          v4l-utils
          sqlite
          ncurses
          jansson
        ];
      })

      #gui tools
      qbittorrent
      rustdesk
      github-desktop
      joplin-desktop
      openrgb-with-all-plugins
      bluez

      #files
      gnome.nautilus #gui file manager
      zip
      unzip
      file #file type detection
      rar #unfree for rar archives

      #cli utils
      kitty #may be ported to hm 
      pciutils
      usbutils
      lshw
      mesa-demos
      vim
      btop
      neofetch
      git
      gh
      i2c-tools # needed for ddcutil
      ddcutil # brightness control
      appimage-run
      vulkan-tools
      cargo-binutils
      xdg-utils
      

      #nix utils
      nix-prefetch-git

      #libs
      gtk3
      #openjdk19 not found in default nixpkgs
      jdk20
      libsForQt5.qt5.qtwayland
      libsForQt5.qt5ct
      qt6.qtwayland
      libnotify #for dunst or mako
      mesa

      #other
      dconf
      
      #(callPackage ./custom/discord-scr.nix {})
      #(callPackage ./custom/rohrkabel.nix {})

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
    ]) ++ lib.lists.optionals (gpuvar.type == "nvidia") (with pkgs; [ 
      egl-wayland #needed for vms on nvidia  hw
    ]);
  };
}
