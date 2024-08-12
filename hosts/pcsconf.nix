{ lib
, config
, pkgs
, cpuvar
, envir
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
  } // lib.optionalAttrs (envir == "Hyprland" || envir == "sway") {
    pam.services.hyprlock = {};
  };
  programs = {
    steam = {                           # games...
      enable = true;
      package = pkgs.over-steam;
      protontricks.enable = true;
    };
    gamescope = {                       # gamescope for games
      enable = true;
      package = pkgs.gamescope;
    };
    wireshark = {                       # wireshark for network analysis
      enable = true;
      package = pkgs.wireshark;
    };
    kdeconnect = {
      enable = true;                    # kdeconnect for android integration
      package = lib.mkDefault pkgs.kdePackages.kdeconnect-kde;
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
    udev.enable = true;                 # udev for hardware
    gnome.sushi.enable = true;          # file preview
    printing.enable = true;             # needed for printing and pdf export
    gvfs.enable = true;                 # Mount, trash, etc
    ratbagd = {                         # mouse settings daemon
      enable = true;
      package = pkgs.over-libratbag;
    };
    hardware = {
      bolt.enable = true;               # thunderbolt support
      openrgb = {
        enable = true;                  # rgb control
        package = pkgs.openrgb-with-all-plugins;
        motherboard = "${cpuvar}";
      };
    };
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      extraPackages = with pkgs; [
        #libsForQt5.qt5.qtgraphicaleffects
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
