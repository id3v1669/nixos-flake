{ config, lib, pkgs, uservars, ... }:
{
  imports = [
    ./titlebuttons
    ./theme1.nix
    ./theme2.nix
    ./theme3.nix
  ];
}