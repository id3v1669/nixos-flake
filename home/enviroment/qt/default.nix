{ config, lib, pkgs, ... }:

{
  qt = {
    enable = true;
    #style.name = "dynamic-color-theme";
    style = {
      package = pkgs.adwaita-qt;
      name = "adwaita-dark";
    };
  };
}