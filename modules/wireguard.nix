{...}: {

  networking.firewall = {
    trustedInterfaces = ["wg0"];
  };

  networking.nat = {
    enable = true;
    externalInterface = "eth0";
    internalInterfaces = ["wg0"];
  };

  networking.wireguard.interfaces.wg0 = {
    ips = ["10.100.0.1/24"];

    generatePrivateKeyFile = true;
    privateKeyFile = "/etc/wireguard/wg0.key";

    peers = [
      {
        publicKey = "cmevZuH/wI10atM25ptaCxirNulb/oygP/b3AaeD6xg=";
        allowedIPs = ["10.100.0.2/32"];
      }
    ];
  };
}
