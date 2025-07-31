{
  lib,
  config,
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
      soteria.enable = true; # soteria polkit
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
    gnome.sushi.enable = true; # file preview
    printing.enable = true; # needed for printing and pdf export
    gvfs.enable = true; # Mount, trash, etc
    libinput.enable = true;
    ratbagd.enable = true; # mouse settings daemon
    hardware = {
      bolt.enable = true; # thunderbolt support
      openrgb = {
        enable = true; # rgb control
        package = pkgs.openrgb-with-all-plugins;
        motherboard = "${cpuvar.type}";
      };
    };
  };
  environment = {
    variables.NIXOS_OZONE_WL = "1";
    etc."hypr/monitor-init.conf".text = mkDefault '''';
    systemPackages = with pkgs; [
      xorg.xhost # xhost
      vulkan-headers
      vulkan-tools
      vulkan-loader

      libva-utils # vaapi test
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
  };
}
