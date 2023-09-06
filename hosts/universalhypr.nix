{ hyprland, lib, config, pkgs, ... }:

{
  security = {
    polkit.enable = true;
  };
  programs = {
    regreet.enable = true;
    dconf.enable = true;
  };


  systemd = {
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

  xdg = {
    autostart.enable = true;
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];
    };
  };
  services = {
    gvfs.enable = true; # Mount, trash, and other functionalities
    mpd.enable = true;
    greetd = {
      enable = true;
      settings = {
        initial_session = {
          user = "user";
          command = "$SHELL -l";
        };
      };
    };
  };
  
  environment = {
    systemPackages = with pkgs; [
      polkit_gnome
      xorg.xhost
    ];
    #sessionVariables = {
    #  EDITOR = "nano";
    #  BROWSER = "firefox";
    #  TERMINAL = "alacritty";
    #   __GL_VRR_ALLOWED = "1";
    #   WLR_NO_HARDWARE_CURSORS = "1";
    #   WLR_RENDERER_ALLOW_SOFTWARE = "1";
    #   CLUTTER_BACKEND = "wayland";
    #   WLR_RENDERER = "vulkan";
    #   GDK_BACKEND = "wayland,x11";
    #   GTK_USE_PORTAL="1";

    #   XDG_CURRENT_DESKTOP = "Hyprland";
    #   XDG_SESSION_DESKTOP = "Hyprland";
    #   XDG_SESSION_TYPE = "wayland";
    # };
  };
}
