{ config, lib, pkgs, ... }:

{
  dconf.settings = (with lib.hm.gvariant; 
      {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };
      });
}