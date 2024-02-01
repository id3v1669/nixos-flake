{ lib
, pkgs
, envir
, ...
}: 
{
  #services.easyeffects = { crashes regularly disabled for now
  #  enable = true;
  #  #preset = ??
  #};
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