{ config
, pkgs
, inputs
, gpuvar
, lib
, ...
}: 
{
  imports = [
    inputs.hyprland.nixosModules.default
  ];
  programs.hyprland.enable = true;
}