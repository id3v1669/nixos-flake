{
  lib,
  envir,
  pkgs,
  ...
}: {
  dconf = {
    enable = true;
    settings = with lib.hm.gvariant;
      {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          clock-show-seconds = true;
        };
        "org/gnome/desktop/privacy" = {
          remember-recent-files = false;
        };
        "org/gnome/shell/extensions/user-theme" = {
          name = "dynamic-color-theme";
        };
        "org/virt-manager/virt-manager/connections" = {
          autoconnect = ["qemu:///system"];
          uris = ["qemu:///system"];
        };
      }
      // lib.optionalAttrs (envir == "GNOME") {
        # "org/gnome/shell" = {
        #   disable-user-extensions = false; # enables user extensions
        #   enabled-extensions = with pkgs.gnomeExtensions; [
        #     gsconnect.extensionUuid
        #     indicator
        #   ];
        # };
      };
  };
}
