{ lib
, pkgs
, envir
, ...
}: 
{
  services = {
    playerctld.enable = true;
  };
  programs = {
    direnv.enable = true;
    ncmpcpp.enable = true;
    tmux.enable = true;
  };
}