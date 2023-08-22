{hyprland, config, lib, pkgs, ...}:
{
  imports = [
    ./enviroment/hyprland/nuc11ph
    ./enviroment/rofi
    ./enviroment/waybar
    ./enviroment/dunst
    ./home.nix
  ];

  home.packages = (with pkgs; [
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
  ]);
}