{
  lib,
  config,
  inputs,
  pkgs,
  cpuvar,
  envir,
  ...
}: let
  inherit (lib) getExe getExe' mkDefault optionalAttrs;
in {
  boot = {
    plymouth.enable = true;
    kernelParams = [
      "quiet"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
      "udev.log_level=3"
      "loglevel=3"
      "usbcore.autosuspend=-1"
      "plymouth.use-simpledrm"
      "fbcon=nodefer"
    ];
  };
  security = {
    polkit.enable = true;
    rtkit.enable = true;
    chromiumSuidSandbox.enable = true;
    pam.services.coldlock = {};
  };
  programs = {
    steam = {
      enable = true;
      protontricks.enable = true;
      extest.enable = true;
    };
    nautilus-open-any-terminal = {
      enable = true;
      terminal = "wezterm";
    };
    gpu-screen-recorder.enable = true; # gpu screen recorder
    traceroute.enable = true; # traceroute
    xwayland.enable = true; # xwayland for x11 apps
    nm-applet.enable = true;
  };
  hardware = {
    cpu.${cpuvar.type}.updateMicrocode = mkDefault config.hardware.enableRedistributableFirmware;
    i2c.enable = true; # i2c devices support
  };
  xdg.portal = {
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = ["gtk"];
      };
      Hyprland = {
        default = ["hyprland" "gtk"];
        "org.freedesktop.impl.portal.FileChooser" = ["gtk"];
        "org.freedesktop.impl.portal.Settings" = ["gtk"];
        "org.freedesktop.impl.portal.Notification" = ["gtk"];
        "org.freedesktop.impl.portal.Inhibit" = ["gtk"];
        "org.freedesktop.impl.portal.Access" = ["gtk"];
      };
    };
  };

  services = {
    fstrim.enable = true; # trim for SSDs
    seatd.enable = true; #
    udev = {
      enable = true; # udev for hardware
      packages = [pkgs.game-devices-udev-rules];
    };

    gnome.sushi.enable = true; # file preview

    printing.enable = true; # needed for printing and pdf export
    gvfs.enable = true; # Mount, trash, etc
    libinput.enable = true;
  };
  environment = {
    variables.NIXOS_OZONE_WL = "1";
    etc."hypr/monitor-init.conf".text = mkDefault '''';
    systemPackages = with pkgs; [
      bash
      ntfs3g
      exfatprogs
      exfat

      polkit_gnome
      xhost
      vulkan-headers
      vulkan-tools
      vulkan-loader
      vulkan-validation-layers
      mesa

      libva-utils # vaapi test
    ];
  };

  systemd = {
    settings.Manager = {
      DefaultTimeoutStopSec = "10s";
    };
    tmpfiles.rules = [
      "d /etc/backgrounds 0755 user users - -"
    ];
    user = {
      services = {
        polkit-gnome-authentication-agent-1 = {
          description = "polkit-gnome-authentication-agent-1";
          wantedBy = ["graphical-session.target"];
          wants = ["graphical-session.target"];
          after = ["graphical-session.target"];
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
}
