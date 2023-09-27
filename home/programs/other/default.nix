{ config, lib, pkgs, envir, ... }: 
{
  #services.easyeffects = { crashes regularly disabled for now
  #  enable = true;
  #  #preset = ??
  #};
  services = {} // lib.optionalAttrs (envir != "gnome") {
    kdeconnect = {
      enable = true;
      indicator = true;
    };
  };
  programs = {
    direnv.enable = true;
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