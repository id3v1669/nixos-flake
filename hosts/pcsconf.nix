{ lib
, config
, pkgs
, cpuvar
, ...
}: 
{
  security.rtkit.enable = true;
  programs = {
    gamemode.enable = true;             # gamemode for lutris and steam
    virt-manager = {                    # virt-manager
      enable = true;
      package = pkgs.virt-manager;
    };
    wireshark = {                       # wireshark for network analysis
      enable = true;
      package = pkgs.wireshark;
    };
    light.enable = true;                # laptop brightness control and fix for openrgb
    traceroute.enable = true;           # traceroute
    adb.enable = true;                  # android debug bridge
  };
  hardware = {
    cpu.${cpuvar}.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    i2c.enable = true;                  # i2c devices support
  };
  services = {
    printing.enable = true;             # needed for printing and pdf export
    flatpak.enable = true;              # crap to be removed later
    hardware.bolt.enable = true;        # thunderbolt support
    xserver.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      extraPackages = with pkgs; [
        libsForQt5.qt5.qtgraphicaleffects
      ];
      theme = "ndct";
    };
  };
  environment.systemPackages = with pkgs; [
    #over-ndct-sddm
    polkit_gnome                        # polkit agent
    xorg.xhost                          # xhost

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