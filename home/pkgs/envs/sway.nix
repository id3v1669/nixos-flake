{ hyprland, inputs, config, lib, pkgs, curversion, uservars, envir, hostname, colorsvar, gpuvar, desk, ... }:
{
  home.packages = (with pkgs; [
    swaybg                        # wallpapers
    cinnamon.nemo-with-extensions # file manager(as nautilus has incorrect behavior with gtk themes)
  ]);
}