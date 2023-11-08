{ config, pkgs, ... }:
{
    services.nextcloud = {
      enable = true;
      hostName = "nextcloud.id3v1669.com";
      package = pkgs.nextcloud27;
      https = true;
      config = {
        adminpassFile = "etc/nextcloud-admin-pass";
        dbtype = "pgsql";
        dbuser = "nextcloud";
        dbhost = "localhost";
        dbname = "nextcloud";
        dbpassFile = "etc/nextcloud-admin-pass";
        dbport = "";
        dbtableprefix = "oc_";
      };
      webfinger = true;
    };
     services.nginx = {
      enable = true;
      recommendedOptimisation = true;
      virtualHosts."nextcloud.id3v1669.com" = {
        listen = [
          { addr = "0.0.0.0"; port = 18080; }
        ];
      };
     };
    services.postgresql = {
      enable = true;
      enableTCPIP = true;
    };
    systemd.services."nextcloud-setup" = {
      requires = ["postgresql.service"];
      after = ["postgresql.service"];
    };
  }