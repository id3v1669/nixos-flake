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
  programs = {
    kdeconnect = {
      enable = true;
      package = pkgs.libsForQt5.kdeconnect-kde;
    };
    regreet.enable = true;
  };
  environment.systemPackages = with pkgs; [
    # for sway
    wdisplays
  ];
  services = {
    gvfs.enable = true;                 # Mount, trash, etc
    mpd.enable = true;                  # music player daemon
    xserver.displayManager.sessionPackages = [
      pkgs.swayfx                       # sway compositor to be recognized by login managers
    ];
  };
}