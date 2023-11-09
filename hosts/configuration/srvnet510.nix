{lib, config, pkgs, uservars, ...}:
{
  environment.etc."nextcloud-admin-pass".text = "test123";
  networking.interfaces.ens3.ipv4.addresses = [
    { address = "77.91.123.39"; prefixLength = 24; }
    { address = "77.91.123.50"; prefixLength = 24; }
  ];
  networking.defaultGateway = "77.91.123.1";
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];
  #networking.firewall.allowedTCPPorts = [ 22 80 443 8080 8090 28943 ];
  networking.firewall.enable = false;
  security.acme = {
    defaults.email = "nico@nico.ni";
    acceptTerms = true;
  };
  services = {
    nextcloud = {
      enable = true;
      package = pkgs.nextcloud27;
      datadir = "/home/${usevars.name}/nextcloud-data";
      database.createLocally = true;
      https = true;
      nginx.hstsMaxAge = 31536000;
      configureRedis = true;
      caching.redis = true;
      webfinger = true;
      maxUploadSize = "10G";
      hostName = "nextcloud.id3v1669.com";
      autoUpdateApps = {
        enable = true;
        startAt = "Sun 14:00:00";
      };
      extraApps = with config.services.nextcloud.package.packages.apps; {
        inherit calendar tasks;
      };
      config = {
        dbtype = "pgsql";
        overwriteProtocol = "https";
        dbuser = "nextcloud";
        dbtableprefix = "nc_";
        dbpassFile = "/etc/nextcloud-admin-pass";
        dbname = "nextcloud";
        dbhost = "/run/postgresql";
        defaultPhoneRegion = "AU";
        adminuser = "nextcloudadmin";
        adminpassFile = "/etc/nextcloud-admin-pass";
        extraTrustedDomains = [ "nextcloud.id3v1669.com" ];
      };
    };
    nginx = {
      enable = true;
        recommendedGzipSettings = true;
        recommendedOptimisation = true;
        recommendedProxySettings = true;
        recommendedTlsSettings = true;
        virtualHosts."nextcloud.id3v1669.com" = {
        enableACME = true;
        forceSSL = true;
        #locations."/".root = pkgs.nextcloud27;
      };
    };
    redis.servers.nextcloud = {
      enable = true;
      port = 31638;
      bind = "127.0.0.1";
    };
    postgresql = {
      enable = true;
      package = pkgs.postgresql;
      ensureDatabases = [ "nextcloud" ];
      ensureUsers = [{
        name = "nextcloud";
        ensurePermissions."DATABASE nextcloud" = "ALL PRIVILEGES";
      }];
    };
  };
  systemd.services."nextcloud-setup" = {
    requires = [ "postgresql.service" ];
    after = [ "postgresql.service" ];
  };
}