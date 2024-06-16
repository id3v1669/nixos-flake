{ config, pkgs, ... }:

{
  services.httpd = {
    enable = true;
    adminAddr = "id3v1669@gmail.com";
    enablePHP = true;
  };
}