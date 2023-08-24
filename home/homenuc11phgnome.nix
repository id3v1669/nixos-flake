{hyprland, config, lib, pkgs, ...}:
{
  imports = [
    ./enviroment/gnome/nuc11phgnome
    ./home.nix
  ];

  home.packages = (with pkgs.gnomeExtensions; [
    appindicator
    notification-banner-reloaded
    gsconnect
    quick-settings-tweaker
  ]);
}