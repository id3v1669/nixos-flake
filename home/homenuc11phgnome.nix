{hyprland, config, lib, pkgs, ...}:
{
  imports = [
    ./enviroment/gnome/nuc11phgnome
    ./home.nix
  ];

  home.packages = (with pkgs; [
  ]);
}