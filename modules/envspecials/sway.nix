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
      xdg-desktop-portal-luminous
    ];
    config.sway = lib.mkForce {
      default = ["gtk"];
      "org.freedesktop.impl.portal.ScreenCast" = ["luminous"];
      "org.freedesktop.impl.portal.Screenshot" = ["luminous"];
      "org.freedesktop.impl.portal.RemoteDesktop" = ["luminous"];
      "org.freedesktop.impl.portal.FileChooser" = ["gtk"];
      "org.freedesktop.impl.portal.Settings" = ["gtk"];
      "org.freedesktop.impl.portal.Notification" = ["gtk"];
      "org.freedesktop.impl.portal.Inhibit" = ["gtk"];
      "org.freedesktop.impl.portal.Access" = ["gtk"];
    };
  };
}
