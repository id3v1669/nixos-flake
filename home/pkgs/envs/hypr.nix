{ hyprland, inputs, config, lib, pkgs, curversion, uservars, envir, hostname, colorsvar, gpuvar, desk, ... }:
{
  home.packages = (with pkgs; [
    hyprpaper                     # wallpapers
    hyprpicker                    # color picker
    cinnamon.nemo-with-extensions # file manager(as nautilus has incorrect behavior with gtk themes)
  ]);
}