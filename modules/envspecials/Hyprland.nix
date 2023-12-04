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
#     outline_proxy_controller = {
#   description = "Outline Proxy Routing Controller";
#   wantedBy = [ "multi-user.target" ];
#   wants = [ "network.target" ];
#   after = [ "network.target" ];
#   serviceConfig = {
#     Type = "simple";
#     ExecStart = "/home/user/tmpmy/OutlineProxyController --socket-filename=/var/run/outline_controller --owning-user-id=1000";
#   };
# };
  };
  environment.systemPackages = (with pkgs; [
    polkit_gnome                        # polkit agent
    xorg.xhost                          # xhost

    # for sddm
    libsForQt5.qt5.qtgraphicaleffects   # sddm theme dep
    libsForQt5.qt5.qtsvg                # sddm theme dep
    libsForQt5.qt5.qtquickcontrols2     # sddm theme dep
    sddm-chili-theme

    shadowsocks-rust
    #over-outline-client2
    over-tun2socks
    #over-shadowsocks-gtk-rs             # shadowsocks gui
  ]);
  services = {
    gvfs.enable = true;                 # Mount, trash, etc
    mpd.enable = true;                  # music player daemon
    xserver.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "chili";
      settings = {
        #Theme.ThemeDir = "/home/${uservars.name}/.config/sddm/themes";
        Wayland.SessionDir = "${pkgs.over-hyprland}/share/wayland-sessions";
      };
    };
  };
}