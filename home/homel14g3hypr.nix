{hyprland, config, lib, pkgs, ...}:
{
  imports = [
    ./enviroment/hyprland/l14g3
    ./enviroment/rofi
    ./enviroment/eww
    ./enviroment/waybar
    ./enviroment/dunst
    ./enviroment/gtk/nuc11phhypr
    ./enviroment/qt/nuc11phhypr
    ./enviroment/gnome/nuc11phhypr
    ./home.nix
  ];

  home.packages = (with pkgs; [
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
  ]);
}