{hyprland, config, lib, pkgs, ...}:
{
  imports = [
    ./enviroment/hyprland/l14g3
    ./enviroment/rofi
    ./enviroment/eww
    ./enviroment/waybar
    ./enviroment/dunst
    ./enviroment/gtk/l14g3hypr
    ./enviroment/qt/l14g3hypr
    ./enviroment/gnome/l14g3hypr
    ./home.nix
  ];

  home.packages = (with pkgs; [
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
  ]);
}