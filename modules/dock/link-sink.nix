{...}: {
  networking.networkmanager.ensureProfiles.profiles = {
    dock-link = {
      connection = {
        id = "dock-link";
        type = "ethernet";
        interface-name = "enp3s0f0";
        autoconnect = "true";
        autoconnect-priority = "100";
      };
      ipv4 = {
        method = "manual";
        addresses = "10.66.0.2/30";
        # docked l14g3 gets internet through msigf66's NAT over this link
        gateway = "10.66.0.1";
        dns = "1.1.1.1;9.9.9.9";
      };
      ipv6.method = "disabled";
    };
  };
}
