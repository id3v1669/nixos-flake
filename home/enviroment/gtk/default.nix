{ config, lib, pkgs, hostname, ... }:
{
  imports = [ 
  ];
  gtk = {
    enable = true;
    theme = {
      name = "Dynamic-Color-GTK-Theme";
    };
    iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-icons;
    };
    cursorTheme = {
      name = "Capitaine Cursors (Gruvbox)";
      package = pkgs.capitaine-cursors-themed;
      size = 30;
    };
    gtk3.extraConfig = {
      "gtk-recent-files-max-age" = 0;
      "gtk-recent-files-limit" = 0;
    };
    gtk4.extraConfig = {
      "gtk-recent-files-max-age" = 0;
      "gtk-recent-files-limit" = 0;
    };
  };
  # xdg.configFile = {
  #   # "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
  #   # "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
  #   # "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  #   "gtk-4.0/assets".source = "${config.home.homeDirectory}/.themes/${config.gtk.theme.name}/gtk-4.0/assets";
  #   "gtk-4.0/gtk.css".source = "${config.home.homeDirectory}/.themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
  #   "gtk-4.0/gtk-dark.css".source = "${config.home.homeDirectory}/.themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  # };
}