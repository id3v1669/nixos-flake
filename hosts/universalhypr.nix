{ hyprland, lib, config, pkgs, uservars, ... }:
let
  hypr-portal = pkgs.xdg-desktop-portal-hyprland.overrideAttrs (oldAttrs: {
    version = "unstable-2023-09-05";
    src = pkgs.fetchFromGitHub {
      owner = "hyprwm";
      repo = "xdg-desktop-portal-hyprland";
      rev = "57a3a41ba6b358109e4fc25c6a4706b5f7d93c6b";
      sha256 = "1xc0lq3ifniny8vzr9izi8cj0smgxngcl8738pkq6n8mygbyc924";
    };
  });
in
{
  security = {
    polkit.enable = true;
  };
  programs = {
    regreet.enable = true;
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
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        hypr-portal
        #libsForQt5.xdg-desktop-portal-kde
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
          user = "${uservars.name}";
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
