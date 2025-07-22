{
  lib,
  config,
  pkgs,
  uservars,
  ...
}: {
  sops.secrets."nextcloud-admin" = {
    sopsFile = ./../secrets/nextcloud.yaml;
    owner = "nextcloud";
  };
  services = {
    nextcloud = {
      enable = true;
      package = pkgs.nextcloud31;
      database.createLocally = true;
      https = true;
      configureRedis = true;
      webfinger = true;
      maxUploadSize = "20G";
      hostName = "nextcloud.${uservars.domain}";
      caching = {
        apcu = true;
        memcached = true;
        redis = true;
      };
      autoUpdateApps = {
        enable = true;
        startAt = "Sun 14:00:00";
      };
      extraApps = with config.services.nextcloud.package.packages.apps; {
        inherit calendar contacts notes onlyoffice tasks;
      };
      config = {
        dbtype = "mysql";
        adminuser = "id3v1669_admin";
        adminpassFile = "${config.sops.secrets."nextcloud-admin".path}";
      };
      nginx = {
        hstsMaxAge = 31536000;
        recommendedHttpHeaders = true;
      };
      phpOptions = {
        catch_workers_output = "yes";
        display_errors = "stderr";
        error_reporting = "E_ALL & ~E_DEPRECATED & ~E_STRICT";
        expose_php = "Off";
        short_open_tag = "Off";
        "opcache.enable_cli" = "1";
        "opcache.fast_shutdown" = "1";
        "opcache.interned_strings_buffer" = "16";
        "opcache.max_accelerated_files" = "10000";
        "opcache.memory_consumption" = "128";
        "opcache.revalidate_freq" = "1";

        "redis.session.locking_enabled" = "1";
        "redis.session.lock_retries" = "-1";
        "redis.session.lock_wait_time" = "10000";
      };
      settings = {
        overwriteProtocol = "https";
        defaultPhoneRegion = "AU";
        maintenance_window_start = 1;
        trusted_domains = [
          "nextcloud.${uservars.domain}"
        ];
        enabledPreviewProviders = [
          "OC\\Preview\\BMP"
          "OC\\Preview\\GIF"
          "OC\\Preview\\JPEG"
          "OC\\Preview\\Krita"
          "OC\\Preview\\MarkDown"
          "OC\\Preview\\MP3"
          "OC\\Preview\\OpenDocument"
          "OC\\Preview\\PNG"
          "OC\\Preview\\TXT"
          "OC\\Preview\\XBitmap"
          "OC\\Preview\\HEIC"
        ];
      };
    };
    nginx.virtualHosts."nextcloud.${uservars.domain}" = {
      enableACME = true;
      forceSSL = true;
    };
    mysql.package = lib.mkForce pkgs.mariadb;
  };
  environment.systemPackages = with pkgs; [
    ffmpeg
    nodejs
  ];
}
# Migration commands:
# 1) maintainance mode
# sudo -i nextcloud-occ maintenance:mode --on
# 2) backup database
# sudo runuser -u nextcloud -- mysqldump -u nextcloud nextcloud > nc.bak
# 3) backup data
# backup /var/lib/nextcloud/data
# 4) setup nextcloud on new server and enter maintenance mode
# 5) restore data files
# 6) restore database
# sudo runuser -u nextcloud -- mysql -u nextcloud  nextcloud < ~/nc.bak
# 7) run fixes in case version mismatch
# sudo -i nextcloud-occ db:add-missing-columns
# sudo -i nextcloud-occ db:add-missing-indices
# sudo -i nextcloud-occ db:add-missing-primary-keys
# 8) run upgrade
# sudo -i nextcloud-occ upgrade
# 9) disable maintenance mode
# sudo -i nextcloud-occ maintenance:mode --off
# 10) fix warnings
# sudo -i nextcloud-occ maintenance:repair --include-expensive

