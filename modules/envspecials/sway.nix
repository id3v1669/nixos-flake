{lib, config, pkgs, uservars, ...}: 
{
  # add env var WLR_NO_HARDWARE_CURSORS = "1"; for hdmi connection later
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
  systemd.user.services = {
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
  environment.systemPackages = with pkgs; [
    # for sway
    wdisplays
    wl-clipboard
  ];
  services = {
    gvfs.enable = true;                 # Mount, trash, etc
    mpd.enable = true;                  # music player daemon
    xserver.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "chili";
      settings = {
        #Theme.ThemeDir = "/home/${uservars.name}/.config/sddm/themes";
        Wayland.SessionDir = "${pkgs.swayfx}/share/wayland-sessions";
      };
    };
  };
}