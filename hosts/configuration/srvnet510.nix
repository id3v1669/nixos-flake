{lib, config, pkgs, uservars, ...}:
{
  networking.interfaces.ens3.ipv4.addresses = [
    { address = "77.91.123.39"; prefixLength = 24; }
    { address = "77.91.123.50"; prefixLength = 24; }
  ];
  networking.defaultGateway = "77.91.123.1";
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];

  virtualisation.oci-containers = {
    backend = "docker";

    containers.nginx-proxy-manager = {
      extraOptions = [
        "--health-cmd=/bin/check-health"
        "--health-interval=10s"
        "--health-timeout=3s"
        "--health-start-period=20s"
      ];
      image = "docker.io/jc21/nginx-proxy-manager:latest";
      ports = [ "80:80" "443:443" "81:81" ];
      volumes = [ "/home/${uservars.name}/ngxmgr/data:/data" "/home/${uservars.name}/ngxmgr/letsencrypt:/etc/letsencrypt" ];
    };
  };

}