{ lib
, config
, pkgs
, cpuvar
, ...
}: 
{
  security = {
    rtkit.enable = true;
    chromiumSuidSandbox.enable = true;
    wrappers."gsr-kms-server" = {       # passwordless display pick for gpu-screen-recorder
      owner = "root";
      group = "root";
      capabilities = "cap_sys_admin+ep";
      source = "${pkgs.gpu-screen-recorder}/bin/gsr-kms-server";
    };
  };
  programs = {
    steam = {                           # games...
      enable = true;
      package = pkgs.over-steam;
      protontricks.enable = true;
      gamescopeSession.enable = true;
    };
    wireshark = {                       # wireshark for network analysis
      enable = true;
      package = pkgs.wireshark;
    };
    kdeconnect = {
      enable = true;                    # kdeconnect for android integration
      package = pkgs.libsForQt5.kdeconnect-kde;
    };
    light.enable = true;                # laptop brightness control and fix for openrgb
    traceroute.enable = true;           # traceroute
    adb.enable = true;                  # android debug bridge
    xwayland.enable = true;             # xwayland for x11 apps
  };
  hardware = {
    cpu.${cpuvar}.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    i2c.enable = true;                  # i2c devices support
    bluetooth.settings = {
      General = {
        ControllerMode = "bredr";
      };
    };
  };
  xdg.portal = {
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk            # for gtk apps
    ];
  };
  services = {
    gnome.sushi.enable = true;          # file preview
    printing.enable = true;             # needed for printing and pdf export
    flatpak.enable = true;              # crap to be removed later
    hardware.bolt.enable = true;        # thunderbolt support
    gvfs.enable = true;                 # Mount, trash, etc
    displayManager.sddm = {
     enable = true;
     wayland.enable = true;
     extraPackages = with pkgs; [
       libsForQt5.qt5.qtgraphicaleffects
     ];
     theme = "ndct";
    };
  };
  environment.systemPackages = with pkgs; [
    tun2socks
    over-ndct-sddm
    polkit_gnome                        # polkit agent
    xorg.xhost                          # xhost
    vulkan-headers
    vulkan-tools
    vulkan-loader

    libva-utils                         # vaapi test
  ];
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
}
