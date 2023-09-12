{ config, lib, pkgs, inputs, ... }:
{
    programs.eww = {
      enable = true;
      package = inputs.eww-tray.eww-wayland;
      configDir = ./ewwconf;
    };
}