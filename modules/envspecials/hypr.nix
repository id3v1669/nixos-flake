{lib, config, pkgs, uservars, ...}: 
{
  security.polkit.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = ( with pkgs; [
      xdg-desktop-portal-gtk
      over-hypr-portal
    ]);
  };
  programs = {
    kdeconnect = {
      enable = true;
      package = pkgs.libsForQt5.kdeconnect-kde
    };
    regreet.enable = true;
  };
  systemd.${uservars.name}.services.polkit-gnome-authentication-agent-1 = {
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