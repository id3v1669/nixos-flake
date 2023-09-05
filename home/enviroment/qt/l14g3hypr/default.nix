{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./../global.nix
  ];
  qt = {
    #add qt scale factor
    
    style = {
      package = pkgs.adwaita-qt;
      name = "adwaita-dark";
    };
  };
}