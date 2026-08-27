{...}: {
  services.rustdesk-server = {
    enable = true;
    openFirewall = true; # TCP 21115-21119, UDP 21116
    signal.relayHosts = ["46.250.240.165"];
  };
}
