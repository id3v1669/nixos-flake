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
    light.enable = true;  #laptop brightness control and fix for openrgb
    traceroute.enable = true;
    adb.enable = true;
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
  };
  environment.systemPackages = with pkgs; [
    polkit_gnome                        # polkit agent
    xorg.xhost                          # xhost

    # for sddm
    libsForQt5.qt5.qtgraphicaleffects   # sddm theme dep
    libsForQt5.qt5.qtsvg                # sddm theme dep
    libsForQt5.qt5.qtquickcontrols2     # sddm theme dep
    sddm-chili-theme

    shadowsocks-rust
    over-tun2socks                       # socks proxy for outline(shadowsocks)
    #over-outline-client2
    #over-shadowsocks-gtk-rs             # shadowsocks gui
  ];
}