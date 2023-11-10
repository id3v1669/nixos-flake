{lib, config, pkgs, uservars, ...}: 
{
  programs.kdeconnect = {
    enable = true;
    package = pkgs.libsForQt5.kdeconnect-kde;
  };
}