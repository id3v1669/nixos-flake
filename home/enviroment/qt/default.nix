{ config, lib, pkgs, ... }:

{
  qt = {
    enable = true;
    platformTheme = "gtk3";
  };
}