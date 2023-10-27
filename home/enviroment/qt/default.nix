{ config, lib, pkgs, ... }:

{
  qt = {
    enable = true;
    #platformTheme = "gtk3";
    style.name = "dynamic-color-theme";
  };
}