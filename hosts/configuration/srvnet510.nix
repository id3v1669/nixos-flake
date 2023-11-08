{lib, config, pkgs, uservars, ...}:
{
  environment.etc."nextcloud-admin-pass".text = "test123";
  networking.interfaces.ens3.ipv4.addresses = [
    { address = "77.91.123.39"; prefixLength = 24; }
    { address = "77.91.123.50"; prefixLength = 24; }
  ];
  networking.defaultGateway = "77.91.123.1";
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];

  containers.nextcloud = {
        autoStart = true;
        bindMounts = {
        "/var/lib/nextcloud" = {
          hostPath = "/mnt/data/nextcloud";
          isReadOnly = false;
        };
        # "/mnt/musica" = {
        #   hostPath = "/mnt/musica";
        #   isReadOnly = true;
        # };
        # "/mnt/pentagramma" = {
        #   hostPath = "/mnt/data/pentagramma";
        #   isReadOnly = false;
        # };
        # "/mnt/websites/emilia" = {
        #   hostPath = "/mnt/data/websites/emilia";
        #   isReadOnly = false;
        # };
        # "/mnt/websites/azazel" = {
        #   hostPath = "/mnt/data/websites/azazel";
        #   isReadOnly = false;
        # };
        # "/mnt/websites/viaggi" = {
        #   hostPath = "/mnt/data/websites/viaggi";
        #   isReadOnly = false;
        # };
        };
        config = import ./nextcloud.nix;
      };

  virtualisation.oci-containers = {
    backend = "docker";

    containers = {
      nginx-proxy-manager = {
        autoStart = true;
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
  };

}