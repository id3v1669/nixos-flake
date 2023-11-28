{lib, config, pkgs, uservars, ...}: 
{
  # add env var WLR_NO_HARDWARE_CURSORS = "1"; for hdmi connection later
  security.polkit.enable = true;
  xdg.portal = {
    enable = true;
    config.common = {
      default = "gtk";
      "org.freedesktop.impl.portal.Screencast" = "hyprland";
      "org.freedesktop.impl.portal.Screenshot" = "hyprland";
    };
    extraPortals = ( with pkgs; [
      over-hypr-portal
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
  systemd.user.services = { #user here is not a username
    polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
  environment.systemPackages = (with pkgs; [
    polkit_gnome
    xorg.xhost
  ]);
  services = {
    gvfs.enable = true; # Mount, trash, etc
    mpd.enable = true; # music player daemon
    greetd = {
     enable = true;
     settings = {
       initial_session = {
         user = "${uservars.name}";
         command = "Hyprland";
       };
     };
    };
  };
}