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
    defaults.email = "nico@nico.ni";
    acceptTerms = true;
  };
  services = {
    nextcloud = {
      enable = true;
      package = pkgs.nextcloud27;
      https = true;
      defaultPhoneRegion = "AU";
      nginx.hstsMaxAge = 31536000;
      configureRedis = true;
      caching.redis = true;
      webfinger = true;
      maxUploadSize = "10G";
      autoUpdateApps = {
        enable = true;
        startAt = "Sun 14:00:00";
      };
      extraApps = with config.services.nextcloud.package.packages.apps; {
        inherit calendar tasks;
      };
      extraAppsEnable = true;
      hostName = "nextcloud.id3v1669.com";
      config.adminpassFile = "/etc/nextcloud-admin-pass";
      config.extraTrustedDomains = [
        "nextcloud.id3v1669.com"
      ];
      extraOptions = {
        redis = {
          host = "127.0.0.1";
          port = 31638;
          dbindex = 0;
          timeout = 1.5;
        };
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
        locations."/".root = pkgs.nextcloud27;
      };
    };
    redis.servers.nextcloud = {
      enable = true;
      port = 31638;
      bind = "127.0.0.1";
    };
  };

# services = {
#   nextcloud = {
#       enable = true;
#       hostName = "nextcloud.id3v1669.com";
#       https = true;
#       package = pkgs.nextcloud27;
#       defaultPhoneRegion = "AU";
#       nginx.hstsMaxAge = 31536000;
#       database.createLocally = true;
#       configureRedis = true;
#       webfinger = true;
#       maxUploadSize = "5000M";
#       phpExtraExtensions = all: [ all.xdebug ];
#       autoUpdateApps = {
#         enable = true;
#         startAt = "Sun 14:00:00";
#       };
#       caching = {
#         #apcu = true;
#         redis = true;
#         #memcached = true;
#       };
#       config = {
#         dbtype = "pgsql";
#         dbname = "nextcloud";
#         dbtableprefix = "oc_";
#         dbpassFile = config.sops.secrets.nextcloud.db-password.path;
#         dbuser = "nextcloud";
#         dbhost = "/run/postgresql";
#         dbport = "28943";
#         adminuser = "nextcloudadmin";
#         adminpassFile = config.sops.secrets.nextcloud.admin-password.path;
#         #extraTrustedDomains = [
#         #  "pim.devkid.net"
#         #];
#       };
#       phpOptions = {
#         # The OPcache interned strings buffer is nearly full with 8, bump to 16.
#         catch_workers_output = "yes";
#         display_errors = "stderr";
#         error_reporting = "E_ALL & ~E_DEPRECATED & ~E_STRICT";
#         expose_php = "Off";
#         "opcache.enable_cli" = "1";
#         "opcache.fast_shutdown" = "1";
#         "opcache.interned_strings_buffer" = "16";
#         "opcache.max_accelerated_files" = "10000";
#         "opcache.memory_consumption" = "128";
#         "opcache.revalidate_freq" = "1";
#         #"openssl.cafile" = "/etc/ssl/certs/ca-certificates.crt";
#         short_open_tag = "Off";

#         "redis.session.locking_enabled" = "1";
#         "redis.session.lock_retries" = "-1";
#         "redis.session.lock_wait_time" = "10000";
#       };
#       poolSettings = {
#         "pm" = "ondemand";
#         "pm.max_children" = 32;
#         "pm.process_idle_timeout" = "10s";
#         "pm.max_requests" = 500;
#       };
#       extraOptions = {
#           redis = {
#             host = "127.0.0.1";
#             port = 31638;
#             dbindex = 0;
#             timeout = 1.5;
#           };
#         };
#     };
#     nginx.virtualHosts."nextcloud.id3v1669.com" = {
#       useACMEHost = "id3v1669.com";
#       forceSSL = true;
#     };
#     postgresql = {
#       enable = true;
#       ensureDatabases = [ "nextcloud" ];
#       ensureUsers = [{
#         name = "nextcloud";
#         ensurePermissions."DATABASE nextcloud" = "ALL PRIVILEGES";
#       }];
#     };
#     phpfpm.pools.nextcloud.settings = {
#       "listen.owner" = config.services.caddy.user;
#       "listen.group" = config.services.caddy.group;
#     };
#     redis.servers.nextcloud = {
#         enable = true;
#         port = 31638;
#         bind = "127.0.0.1";
#       };
# };
# systemd.services."nextcloud-setup" = {
#       requires = [ "postgresql.service" ];
#       after = [ "postgresql.service" ];
#     };

  # virtualisation.oci-containers = {
  #   backend = "docker";
  #   containers = {
  #     nginx-proxy-manager = {
  #       autoStart = true;
  #       extraOptions = [
  #         "--health-cmd=/bin/check-health"
  #         "--health-interval=10s"
  #         "--health-timeout=3s"
  #         "--health-start-period=20s"
  #       ];
  #       image = "docker.io/jc21/nginx-proxy-manager:latest";
  #       ports = [ "80:80" "443:443" "81:81" ];
  #       volumes = [ "/home/${uservars.name}/ngxmgr/data:/data" "/home/${uservars.name}/ngxmgr/letsencrypt:/etc/letsencrypt" ];
  #     };
  #     nextcloud = {
  #       autoStart = true;
  #       image = "nextcloud:latest";
  #       ports = [ "77.91.123.50:8090:80" "77.91.123.50:8080:8080"];
        
  #     };
  #   };
  # };
  # services.postgresql = {
  #     enable = true;
  #     port = 5432;
  #     dataDir = "/home/${uservars.name}/nextcloud/postgres";
  #     ensureDatabases = ["nextcloud"];
  #     ensureUsers = [{
  #       name = "nextclouddbadmin";
  #       ensurePermissions = {
  #         "DATABASE \"nextcloud\"" = "ALL PRIVILEGES";
  #       };
  #     }];
  #     settings = {
  #       max_connections = "50";
  #       shared_buffers = "1280MB";
  #       effective_cache_size = "3840MB";
  #       maintenance_work_mem = "320MB";
  #       checkpoint_completion_target = "0.9";
  #       wal_buffers = "16MB";
  #       default_statistics_target = "100";
  #       random_page_cost = "4";
  #       effective_io_concurrency = "2";
  #       work_mem = "6553kB";
  #       huge_pages = "off";
  #       min_wal_size = "1GB";
  #       max_wal_size = "4GB";
  #     };
  #   };

}