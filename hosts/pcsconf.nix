{lib, config, pkgs, curversion, deflocale, uservars, hostname, inputs, envir, cpuvar, system, gpuvar, desk, ...}: 
{
  security = {
    rtkit.enable = true;
    pam.services.swaylock = {};
  };
  programs = {
    gamemode.enable = true;
    wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };
    light.enable = true;                # laptop brightness control and fix for openrgb
    traceroute.enable = true;           # traceroute
    adb.enable = true;                  # android debug bridge
  };
  hardware = {
    i2c.enable = true;
    cpu.${cpuvar}.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    bluetooth.enable = true;
  };
  services = {
    blueman.enable = true;
    printing.enable = true;
    flatpak.enable = true;
    hardware.bolt.enable = true;
    # greetd = let
    #   gtkgreetCfg = pkgs.writeText "gtkgreet.conf" ''
    #     exec-once = ${pkgs.greetd.gtkgreet}/bin/gtkgreet --layer-shell --command=Hyprland
    #   '';
    # in {
    #   enable = true;
    #   settings = {
    #     default_session = {
    #       command = "${pkgs.over-hyprland}/bin/Hyprland --config ${gtkgreetCfg}";
    #     };
    #   };
    # };
    xserver.displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
  environment.systemPackages = with pkgs; [
    polkit_gnome                        # polkit agent
    xorg.xhost                          # xhost

    libva-utils                          # vaapi test
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