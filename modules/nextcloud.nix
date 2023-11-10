{lib, config, pkgs, uservars, ...}:
{
  sops.secrets."nextcloud-admin" = {
    sopsFile = ./../secrets/nextcloud.enc.yaml;
    owner = "nextcloud";
  };
  services = {
    nextcloud = {
      enable = true;
      package = pkgs.nextcloud27;
      database.createLocally = true;
      https = true;
      nginx.hstsMaxAge = 31536000;
      configureRedis = true;
      webfinger = true;
      maxUploadSize = "10G";
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
        overwriteProtocol = "https";
        defaultPhoneRegion = "AU";
        adminuser = "${uservars.name}";
        adminpassFile = "${config.sops.secrets."nextcloud-admin".path}";
        extraTrustedDomains = [
          "nextcloud.${uservars.domain}"
        ];
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
      extraOptions.enabledPreviewProviders = [
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