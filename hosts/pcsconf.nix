{ lib
, config
, pkgs
, cpuvar
, envir
, uservars
, colorsvar
, ...
}:
let 
  inherit (lib) getExe getExe' mkDefault optionalAttrs;
in
{
  boot.extraModprobeConfig = ''
    # fix the F* keys on nuphy air 75 win mode
    options hid_apple fnmode=0
  '';
  security = {
    rtkit.enable = true;
    chromiumSuidSandbox.enable = true;
  } // optionalAttrs (envir == "Hyprland") {
    pam.services.hyprlock = {};
  };
  programs = {
    steam = {                           # games...
      enable = true;
      protontricks.enable = true;
    };
    gamescope = {                       # gamescope for games
      enable = true;
      package = pkgs.gamescope;
    };
    kdeconnect = {
      enable = true;                    # kdeconnect for android integration
      package = mkDefault pkgs.kdePackages.kdeconnect-kde;
    };
    gpu-screen-recorder.enable = true;  # gpu screen recorder
    light.enable = true;                # laptop brightness control and fix for openrgb
    traceroute.enable = true;           # traceroute
    adb.enable = true;                  # android debug bridge
    xwayland.enable = true;             # xwayland for x11 apps
  };
  hardware = {
    cpu.${cpuvar.type}.updateMicrocode = mkDefault config.hardware.enableRedistributableFirmware;
    i2c.enable = true;                  # i2c devices support
  };
  xdg.portal = {
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk            # for gtk apps
    ];
  };
  services = {
    seatd.enable = true;                # 
    udev.enable = true;                 # udev for hardware
    gnome.sushi.enable = true;          # file preview
    printing.enable = true;             # needed for printing and pdf export
    gvfs.enable = true;                 # Mount, trash, etc
    libinput.enable = true;             # 
    ratbagd = {                         # mouse settings daemon
      enable = true;
    };
    hardware = {
      bolt.enable = true;               # thunderbolt support
      openrgb = {
        enable = true;                  # rgb control
        package = pkgs.openrgb-with-all-plugins;
        motherboard = "${cpuvar.type}";
      };
    };
  };
  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    etc."hypr/monitor-init.conf".text = mkDefault '''';
    systemPackages = with pkgs; [
      tun2socks
      polkit_gnome                        # polkit agent
      xorg.xhost                          # xhost
      vulkan-headers
      vulkan-tools
      vulkan-loader

      libva-utils                         # vaapi test
    ];
  };
  systemd = let
    extraConfig = ''
      DefaultTimeoutStopSec=10s
    '';
  in {
    inherit extraConfig;
    tmpfiles.rules = [
      "d /etc/backgrounds 0755 user users - -"
    ];
    user = {
      inherit extraConfig;
      services = {
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
    };
  };
  programs.regreet = {
    enable = true;
    theme = {
#      package = pkgs.dynamic-color-gtk-theme;
      name = "Dynamic-Color-GTK-Theme";
    };
    cursorTheme = {
      package = pkgs.capitaine-cursors-themed;
      name = "Capitaine Cursors (Gruvbox)";
    };
    font = {
      package = pkgs._0xproto;
      name = "0xProto 13";
    };
    iconTheme = {
      package = pkgs.gruvbox-plus-icons;
      name = "Gruvbox-Plus-Dark";
    };
    settings = {
      background = {
        fit = "Cover";
        path = "/etc/backgrounds/${colorsvar}/${uservars.wp}";
      };
      GTK = {
        application_prefer_dark_theme = true;
      };
    };
  };
}
