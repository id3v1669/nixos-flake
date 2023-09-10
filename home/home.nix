{ hyprland, config, lib, pkgs, curversion, uservars, envir, hostname, ... }:
{
  imports = [
    ./programs
    ./../scripts
    ./enviroment/qt
    (./. + "/enviroment/gnome/${hostname}${envir}")
    (./. + "/enviroment/gtk/${hostname}")
  ]++ lib.lists.optionals (envir == "hypr") [
    (./. + "/enviroment/hyprland/${hostname}")
    ./enviroment/rofi
    ./enviroment/eww
    ./enviroment/waybar
    ./enviroment/dunst
    ./enviroment/xdg
  ] ++ lib.lists.optionals (envir == "gnome") [
  ];
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
      qpwgraph #gui for pipewire graph
      mpc-cli

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

      #vid photo sound etc
      krita
      spotify
      ffmpeg
      vlc
      nomacs
      gnome.eog

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

      #utils
      partition-manager
      qbittorrent
      pciutils
      usbutils
      lshw
      file
      gnome.nautilus
      rustdesk
      btop
      neofetch
      git
      gh
      github-desktop
      iwd
      zip
      unzip
      i2c-tools # needed for ddcutil
      ddcutil # brightness control
      appimage-run
      vulkan-tools

      #nix utils
      nix-prefetch-git

      #other
      openjdk19
      libsForQt5.qt5.qtwayland
      libsForQt5.qt5ct
      qt6.qtwayland
      (callPackage ./custom/xwaylandvideobridge.nix {})

      #temp
      git
      kitty
      wofi
    ]) ++ lib.lists.optionals (envir == "gnome") (with pkgs;[
      gnomeExtensions.appindicator
      gnomeExtensions.notification-banner-reloaded
      gnomeExtensions.gsconnect
      gnomeExtensions.quick-settings-tweaker
      blackbox
    ]);
  };
}
