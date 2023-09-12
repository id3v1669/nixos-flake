{ config, lib, pkgs, inputs, ... }:
{
    programs.eww = {
      enable = true;
      package = inputs.eww-tray.packages.x86_64-linux.eww-wayland;
      configDir = ./ewwconf;
    };
}