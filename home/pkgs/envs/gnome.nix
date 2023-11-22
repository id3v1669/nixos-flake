{ hyprland, inputs, config, lib, pkgs, curversion, uservars, envir, hostname, colorsvar, gpuvar, desk, ... }:
{
  home.packages = (with pkgs; [
    gnomeExtensions.appindicator                  # apptray support for gnome
    gnomeExtensions.notification-banner-reloaded  # notification mod
    gnomeExtensions.gsconnect                     # kdeconnect for gnome
    gnomeExtensions.quick-settings-tweaker        # quick settings mod
    blackbox                                      # terminal emulator
  ]);
}