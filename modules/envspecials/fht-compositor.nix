{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    fht-compositor
    fht-share-picker
  ];
  xdg.portal = {
    wlr.enable = false;
    configPackages = [pkgs.fht-compositor];

    config.common = {
      "org.freedesktop.impl.portal.Access" = "gtk";
      "org.freedesktop.impl.portal.Notification" = "gtk";
      "org.freedesktop.impl.portal.ScreenCast" = "fht-compositor";
    };
  };
  services = {
    displayManager.sessionPackages = [pkgs.fht-compositor];
  };
}
