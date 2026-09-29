# Point-to-point link to l14g3 acting as network dock (RJ45 direct cable).
{...}: {
  networking.networkmanager.ensureProfiles.profiles = {
    dock-link = {
      connection = {
        id = "dock-link";
        type = "ethernet";
        interface-name = "enp5s0";
        autoconnect = "true";
        autoconnect-priority = "100";
      };
      ipv4 = {
        method = "manual";
        addresses = "10.66.0.1/30";
        never-default = "true";
      };
      ipv6.method = "disabled";
    };
  };
  # docked l14g3 routes its internet through this machine's wifi
  networking.nat = {
    enable = true;
    internalIPs = ["10.66.0.0/30"];
    externalInterface = "wlp4s0";
  };
}
