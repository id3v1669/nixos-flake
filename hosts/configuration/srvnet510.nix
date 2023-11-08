{lib, config, pkgs, uservars, ...}:
{
  environment.etc."nextcloud-admin-pass".text = "test123";
  networking.interfaces.ens3.ipv4.addresses = [
    { address = "77.91.123.39"; prefixLength = 24; }
    { address = "77.91.123.50"; prefixLength = 24; }
  ];
  networking.defaultGateway = "77.91.123.1";
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];

  security.acme = {
    acceptTerms = true;
    email = "nico@nico.ni";
  };

  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    sslCiphers = "AES256+EECDH:AES256+EDH:!aNULL";
    virtualHosts = {
      "nextcloud.id3v1669.com" = {
        forceSSL = true;
        enableACME = true;
      };
    };
  };
  services.nextcloud = {
    enable = true;
    hostName = "nextcloud.id3v1669.com";
    nginx.enable = true;
    https = true;
    autoUpdateApps.enable = true;
    autoUpdateApps.startAt = "05:00:00";

    config = {
      overwriteProtocol = "https";
      dbtype = "pgsql";
      dbuser = "nextcloud";
      dbhost = "/run/postgresql";
      dbname = "nextcloud";
      dbpassFile = "/etc/nextcloud-admin-pass";
      adminpassFile = "/etc/nextcloud-admin-pass";
      adminuser = "admin";
    };
  };
  services.postgresql = {
    enable = true;
    ensureDatabases = [ "nextcloud" ];
    ensureUsers = [{ 
      name = "nextcloud";
       ensurePermissions."DATABASE nextcloud" = "ALL PRIVILEGES";
    }];
  };

  # virtualisation.oci-containers = {
  #   backend = "docker";

  #   containers.nginx-proxy-manager = {
  #     extraOptions = [
  #       "--health-cmd=/bin/check-health"
  #       "--health-interval=10s"
  #       "--health-timeout=3s"
  #       "--health-start-period=20s"
  #     ];
  #     image = "docker.io/jc21/nginx-proxy-manager:latest";
  #     ports = [ "80:80" "443:443" "81:81" ];
  #     volumes = [ "/home/${uservars.name}/ngxmgr/data:/data" "/home/${uservars.name}/ngxmgr/letsencrypt:/etc/letsencrypt" ];
  #   };
  # };

}