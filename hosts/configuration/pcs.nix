{lib, config, pkgs, curversion, deflocale, uservars, hostname, inputs, envir, cpuvar, system, gpuvar, ...}: 
{
  security = {
    rtkit.enable = true;
  } // lib.optionalAttrs (envir == "hypr") {
    polkit.enable = true;
  };
  sound.enable = true;
  xdg = {
  } // lib.optionalAttrs (envir == "hypr") {
    portal = {
      enable = true;
      extraPortals = ( with pkgs; [
        xdg-desktop-portal-gtk
        over-hypr-portal
      ]);
    };
  };
  systemd = {
    #for now
  } // lib.optionalAttrs (envir == "hypr") {
    user.services.polkit-gnome-authentication-agent-1 = {
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
}