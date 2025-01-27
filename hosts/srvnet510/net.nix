{ pkgs
, uservars
, ...
}:
{
  networking = {
    interfaces.ens3.ipv4.addresses = [
      { address = "77.91.123.39"; prefixLength = 24; }
      { address = "77.91.123.50"; prefixLength = 24; }
    ];
    defaultGateway = "77.91.123.1";
    nameservers = [ "1.1.1.1" "8.8.8.8" ];
    firewall.allowedTCPPorts = [ 26783 80 443 ];
  };
  services.openssh.ports = [ 26783 ];
}