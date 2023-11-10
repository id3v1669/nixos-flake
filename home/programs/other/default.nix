{ config, lib, pkgs, envir, ... }: 
{

  #services.easyeffects = { crashes regularly disabled for now
  #  enable = true;
  #  #preset = ??
  #};
  #services = {} // lib.optionalAttrs (envir != "gnome") {
  #  kdeconnect = {
  #    enable = true;
  #    indicator = true;
  #  };
    #gammastep = {
    #  enable = true;
    #  tray = true;
    #};
 # };
  programs = {
    direnv.enable = true;
    java = {
      enable = true;
      package = pkgs.jdk20;
    };
    obs-studio = {
      enable = true;
      package = pkgs.obs-studio;
      plugins = [
        pkgs.obs-studio-plugins.wlrobs
      ];
    };
    ncmpcpp.enable = true;
  };
}