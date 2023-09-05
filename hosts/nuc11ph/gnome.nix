{ config, lib, pkgs, ... }:
{
  imports =[
    ./hw.nix
    ./../universal.nix
    ./../universalgnome.nix
  ];
}