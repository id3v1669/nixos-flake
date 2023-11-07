{ hyprland, inputs, config, lib, pkgs, curversion, uservars, envir, hostname, colorsvar, gpuvar, desk, ... }:
{
  imports = [
    ./programs
  ] ++ lib.lists.optionals (desk == "desktop" || desk == "laptop") [
    ./../scripts
    ./enviroment/qt
    ./enviroment/gnome
    ./enviroment/gtk
    inputs.nix-colors.homeManagerModules.default
  ] ++ lib.lists.optionals (envir == "hypr") [
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
      #web
      curl
      wget

      #cli utils
      vim
      btop
      neofetch
      git
      gh
      age
      sops
      
    ]) ++ lib.lists.optionals (desk == "server") (with pkgs;[

    ]) ++ lib.lists.optionals (desk == "desktop" || desk == "laptop") (with pkgs;[
      #tests
      arrpc #test for rpc
      protonup-qt
      libsForQt5.qt5ct
      qt6Packages.qt6ct
      #(callPackage ./programs/other/outline.nix {})
      nmap
      filezilla

      #screenshots
      grim
      slurp

      #sound
      pamixer #cli mixer
      pavucontrol #gui mixer
      pulseaudio #just lib to use pactl, pipewire is in use
      helvum 
      qpwgraph #gui for pipewire graph
      mpc-cli 
      qjackctl 
      soundux #soundpad
      asio #??
      wineasio

      #vm, virt and emulators
      virt-manager
      distrobox
      docker-compose

      #web
      nm-tray
      ungoogled-chromium
      wireguard-tools
      networkmanagerapplet
      #iwd

      #vid photo etc
      (callPackage ./programs/other/xwaylandvideobridge.nix {})
      ffmpeg
      vlc
      mpv
      nomacs
      gnome.eog
      hyprpicker #color picker
      ffmpegthumbnailer
      hyprpaper #walpapers
      
      #chat
      telegram-desktop
      whatsapp-for-linux
      (callPackage ./programs/discord/vesktop.nix {})
      
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

      #files
      gnome.nautilus #gui file manager
      zip
      unzip
      file #file type detection
      rar #unfree for rar archives

      #text & docs
      joplin-desktop
      libreoffice-qt
      hunspell
      hunspellDicts.en_US-large
      hunspellDicts.ru_RU

      #other gui tools
      qbittorrent
      rustdesk
      github-desktop
      openrgb-with-all-plugins
      bluez
      over-eww
      #inputs.eww-tray.packages.x86_64-linux.eww-wayland

      #other cli utils
      kitty #may be ported to hm 
      pciutils
      usbutils
      lshw
      mesa-demos
      i2c-tools # needed for ddcutil
      ddcutil # brightness control
      appimage-run
      vulkan-tools
      cargo-binutils
      xdg-utils
      
    #   #nix utils
      nix-prefetch-git

    #   #libs
      gtk3
      libpng
      libnotify #for dunst or mako
      mesa

    #   #other
       dconf
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
      #krita #not in use for now
      gimp
    ]) ++ lib.lists.optionals (gpuvar.type == "nvidia") (with pkgs; [ 
      egl-wayland #needed for vms on nvidia  hw
    ]) ++ lib.lists.optionals (hostname == "nuc11ph") (with pkgs; [
      (callPackage ./programs/other/tlauncher.nix {})
    ]);
  };
}
