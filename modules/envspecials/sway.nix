{ config
, pkgs
, ...
}: 
{
  security.polkit.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common = {
      default = "gtk";
      "org.freedesktop.impl.portal.Screencast" = "wlr";
      "org.freedesktop.impl.portal.Screenshot" = "wlr";
    };
    extraPortals = ( with pkgs; [
      xdg-desktop-portal-gtk
    ]);
  };
  environment.systemPackages = with pkgs; [
    wdisplays
  ];
  services = {
    displayManager.sessionPackages = [
      pkgs.swayfx
    ];
  };
}
