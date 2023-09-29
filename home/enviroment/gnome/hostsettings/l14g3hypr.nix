{ config, lib, pkgs, ... }:

{
  dconf = {
    enable = true;
    settings = (with lib.hm.gvariant; 
    {
      "org/gnome/desktop/interface" = {
        text-scaling-factor = "0.8";
      };
    });
  };
}