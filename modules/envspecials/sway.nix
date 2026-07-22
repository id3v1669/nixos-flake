{
  pkgs,
  lib,
  ...
}: {
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  services.displayManager.defaultSession = "sway";
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
    config.sway = lib.mkForce {
      default = ["wlr" "gtk"];
      "org.freedesktop.impl.portal.FileChooser" = ["gtk"];
      "org.freedesktop.impl.portal.Settings" = ["gtk"];
      "org.freedesktop.impl.portal.Notification" = ["gtk"];
      "org.freedesktop.impl.portal.Inhibit" = ["gtk"];
      "org.freedesktop.impl.portal.Access" = ["gtk"];
    };
  };
}
