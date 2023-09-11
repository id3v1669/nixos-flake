{ config, lib, pkgs, ... }: 
{
  services.easyeffects = {
    enable = true;
    #preset = ??
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