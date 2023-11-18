{lib, config, pkgs, uservars, ...}: 
{
  security.polkit.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
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

    # for sway
    wdisplays
    swaylock
    swayidle
    wl-clipboard
  ]);
  services = {
    gvfs.enable = true; # Mount, trash, etc
    mpd.enable = true; # music player daemon
    greetd = {
     enable = true;
     settings = {
       initial_session = {
         user = "${uservars.name}";
         command = "sway --unsupported-gpu";
       };
     };
    };
  };
}