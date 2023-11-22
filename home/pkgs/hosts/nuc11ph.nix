{ hyprland, inputs, config, lib, pkgs, curversion, uservars, envir, hostname, colorsvar, gpuvar, desk, ... }:
{
  home.packages = (with pkgs; [
    over-tlauncher # launcher for minecraft
    spotify        # music
    #krita         # video editing currently installed via flatpak(fix needed)
    gimp           # image editing
  ]);
}