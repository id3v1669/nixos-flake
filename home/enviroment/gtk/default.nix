{ config, lib, pkgs, hostname, ... }:
{
  imports = [ 
    ./theme
  ];
  gtk = {
    enable = true;
    theme = {
      name = "dynamic-color-theme";
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override { color = "black"; };
    };
    cursorTheme = {
      name = "Capitaine Cursors (Gruvbox)";
      package = pkgs.capitaine-cursors-themed;
      size = 15;
    };
  };
}