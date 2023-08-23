{ config, lib, pkgs, ... }:

{
  qt = {
    enable = true;
    style = {
      package = pkgs.adwaita-qt;
      name = adwaita-dark;
    };
  };
}