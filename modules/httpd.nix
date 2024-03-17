{ config, pkgs, ... }:

{
  services.httpd = {
    enable = true;
    adminAddr = "nico@nico.ni";
    enablePHP = true;
  };
}