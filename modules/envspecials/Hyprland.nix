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
      "org.freedesktop.impl.portal.Screencast" = "hyprland";
      "org.freedesktop.impl.portal.Screenshot" = "hyprland";
    };
    extraPortals = with pkgs; [
      over-hypr-portal                          # hyprland portal
      xdg-desktop-portal-gtk                    # for gtk apps
    ];
  };
  programs = {
    kdeconnect = {
      enable = true;
      package = pkgs.libsForQt5.kdeconnect-kde; # kdeconnect-kde
    };
  };
  environment.systemPackages = with pkgs; [
  ];
  services = {
    gvfs.enable = true;                         # Mount, trash, etc
    mpd.enable = true;                          # music player daemon
    xserver.displayManager.sessionPackages = [
      pkgs.over-hyprland                         # hyprland session to be recognized by login managers
    ];
  };
}