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
      name = "Gruvbox-Plus-Dark"; #"Papirus-Dark";
      package = pkgs.over-gruv-icons; #pkgs.papirus-icon-theme.override { color = "black"; };
    };
    cursorTheme = {
      name = "Capitaine Cursors (Gruvbox)";
      package = pkgs.capitaine-cursors-themed;
      size = 15;
    };
  };
}