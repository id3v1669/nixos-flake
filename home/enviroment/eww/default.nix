{ config, lib, pkgs, ... }:

{
    programs.eww = {
      enable = true;
      package = pkgs.eww-wayland;
      configDir = ./ewwconf;
    };
}