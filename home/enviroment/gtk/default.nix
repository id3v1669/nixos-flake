{ config, lib, pkgs, hostname, ... }:

{
  imports = [ 
    (./. + "/hostsettings/${hostname}.nix")
  ];
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