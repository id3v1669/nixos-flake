{ config, lib, pkgs, ... }:

{
  #gtk settings needed for xdg-portal apps to have dark theme
  gtk = {
    enable = true;
    gtk2.extraConfig = "gtk-application-prefer-dark-theme=1";
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
  };
}