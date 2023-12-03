{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    over-tlauncher # launcher for minecraft
    spotify        # music
    #krita         # video editing currently installed via flatpak(fix needed)
    gimp           # image editing
  ];
}