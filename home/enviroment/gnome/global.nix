{ config, lib, pkgs, ... }:

{
  dconf.settings = (with lib.hm.gvariant; 
  {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  });
}