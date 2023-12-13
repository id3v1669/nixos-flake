{ lib
, ...
}:
{
  dconf = {
    enable = true;
    settings = (with lib.hm.gvariant; 
    {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        clock-show-seconds = true;
      };
      "org/gnome/shell/extensions/user-theme" = {
        name = "dynamic-color-theme";
      };
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
        uris = ["qemu:///system"];
      };
    });
  };
}