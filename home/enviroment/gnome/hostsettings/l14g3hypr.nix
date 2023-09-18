{ config, lib, pkgs, ... }:

{
  dconf.settings = (with lib.hm.gvariant; 
      {
        "org/gnome/desktop/interface" = {
          text-scaling-factor = "0.8";
        };
      });
}