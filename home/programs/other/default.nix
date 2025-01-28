{ lib
, pkgs
, envir
, ...
}: 
{
  services.easyeffects = {
    enable = true;
  };
  services = {
    playerctld.enable = true;
 };
  programs = {
    direnv.enable = true;
    ncmpcpp.enable = true;
    tmux.enable = true;
  };
}