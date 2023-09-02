{hyprland, config, lib, pkgs, ...}:
{
  imports = [
    ./enviroment/hyprland/alexpc
    ./enviroment/rofi
    ./enviroment/eww
    ./enviroment/waybar
    ./enviroment/dunst
    ./enviroment/gtk/alexpchypr
    ./enviroment/qt/alexpchypr
    ./enviroment/gnome/alexpchypr
    ./home.nix
  ];

  home.packages = (with pkgs; [
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
  ]);
}