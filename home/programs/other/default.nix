{ config, lib, pkgs, ... }: 
{
  programs = {
    direnv.enable = true;
    obs-studio = {
      enable = true;
      package = pkgs.obs-studio;
      plugins = [
        pkgs.obs-studio-plugins.wlrobs
      ];
    };
  };
}