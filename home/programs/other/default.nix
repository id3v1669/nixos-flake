{ config, lib, pkgs, ... }: 
{
  #services.easyeffects = { crashes regularly disabled for now
  #  enable = true;
  #  #preset = ??
  #};
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