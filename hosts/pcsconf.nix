{ lib
, config
, pkgs
, cpuvar
, ...
}: 
{
  security = {
    rtkit.enable = true;
    pam.services.swaylock = {};         # swaylock pam service for screen lock
  };
  programs = {
    virt-manager = {                    # virtual machine manager
      enable = true;
      package = pkgs.virt-manager;
    };
    gamemode.enable = true;             # gamemode for lutris and steam
    wireshark = {                       # wireshark with root privileges
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
    bluetooth.enable = true;            # bluetooth
  };
  services = {
    blueman.enable = true;              # bluetooth manager
    printing.enable = true;             # needed for printing and pdf export
    flatpak.enable = true;              # crap to be removed later
    hardware.bolt.enable = true;        # thunderbolt support
    xserver.displayManager.gdm = {      # gdm is used as sddm and greetd take too long to load and sddm sometimes fails to start session
      enable = true;
      wayland = true;
    };
  };
  environment.systemPackages = with pkgs; [
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