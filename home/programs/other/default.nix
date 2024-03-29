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
    java = {
      enable = true;
      package = pkgs.jdk20;
    };
    ncmpcpp.enable = true;
  };
}