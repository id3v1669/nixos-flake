{ config, lib, pkgs, ... }:

{
  gtk = {
    gtk2.extraConfig = "gtk-application-prefer-dark-theme=1 gtk-scale=0.8";
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme=1;
      gtk-scale="0.8";
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme=1;
      gtk-scale="0.8";
    };
  };
}