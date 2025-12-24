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
    extraModprobeConfig = ''
      # fix the F* keys on nuphy air 75 win mode
      options hid_apple fnmode=0
    '';
  };
  security =
    {
      polkit.enable = true;
      rtkit.enable = true;
      chromiumSuidSandbox.enable = true;
    }
    // optionalAttrs (envir == "Hyprland") {
      pam.services.hyprlock = {};
    };
  programs = {
    steam = {
      enable = true;
      protontricks.enable = true;
      extest.enable = true;
    };
    gpu-screen-recorder.enable = true; # gpu screen recorder
    light.enable = true; # laptop brightness control and fix for openrgb
    traceroute.enable = true; # traceroute
    adb.enable = true; # android debug bridge
    xwayland.enable = true; # xwayland for x11 apps
  };
  hardware = {
    cpu.${cpuvar.type}.updateMicrocode = mkDefault config.hardware.enableRedistributableFirmware;
    i2c.enable = true; # i2c devices support
  };
  xdg.portal = {
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk # for gtk apps
    ];
  };

  services = {
    fstrim.enable = true; # trim for SSDs
    seatd.enable = true; #
    udev.enable = true; # udev for hardware
    gnome.sushi.enable = false; # file preview
    printing.enable = true; # needed for printing and pdf export
    gvfs.enable = true; # Mount, trash, etc
    libinput.enable = true;
    ratbagd.enable = false; # mouse settings daemon
    lsfg-vk = {
      enable = true;
      package = inputs.lsfg-vk.packages.${pkgs.stdenv.hostPlatform.system}.lsfg-vk.overrideAttrs (old: rec {
        src = pkgs.fetchFromGitHub {
          owner = "PancakeTAS";
          repo = "lsfg-vk";
          rev = "ff1a0f72a7d6d08b84d58b7b4dc5f05c9f904f98";
          hash = "sha256-d1x90BUgQAHPn0yK8K833lvmeleQyTi2MmWy3vKW+v4=";
          fetchSubmodules = true;
        };
      });
      ui.enable = false;
    };
    hardware = {
      bolt.enable = false; # thunderbolt support
      openrgb = {
        enable = false; # rgb control
        package = pkgs.openrgb-with-all-plugins;
        motherboard = "${cpuvar.type}";
      };
    };
  };
  environment = {
    variables.NIXOS_OZONE_WL = "1";
    etc."hypr/monitor-init.conf".text = mkDefault '''';
    systemPackages = with pkgs; [
      ntfs3g
      exfatprogs
      exfat

      polkit_gnome
      xorg.xhost # xhost
      vulkan-headers
      vulkan-tools
      vulkan-loader

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
