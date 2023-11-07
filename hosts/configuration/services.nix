{lib, config, pkgs, fetchFromGitLab, curversion, deflocale, uservars, hostname, envir, cpuvar, gpuvar, desk, ...}: 
{
  services = {
    xserver = {
      enable = true;
      layout = "${deflocale.kblayout}";
      xkbVariant = "${deflocale.kbvariant}";
      xkbOptions = "${deflocale.kboption}";
      videoDrivers = [ 
      ] ++ lib.lists.optionals (gpuvar.type == "intel")[
        "i915"
      ] ++ lib.lists.optionals (gpuvar.type == "nvidia")[
        "nvidia"
      ] ++ lib.lists.optionals (gpuvar.type == "amd" || cpuvar == "amd" ) [
        "amdgpu"
      ] ;
  } // lib.optionalAttrs (envir == "gnome") {
      desktopManager.gnome = {
        enable = true;
        debug = false;
      };
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };
  } // lib.optionalAttrs (desk == "server") {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "yes";
      };
    };
  } // lib.optionalAttrs (desk == "srvnet510") {
    environment.etc."nextcloud-admin-pass".text = "test123";
    nextcloud = {
      enable = true;
      package = pkgs.nextcloud27;
      hostName = "localhost";
      config.adminpassFile = "/etc/nextcloud-admin-pass"; #config.sops.secrets.nextcloud.admin-password.path;
    };
    # nextcloud = {
    #   enable = true;
    #   hostName = "nextcloud.id3v1669.com";
    #   https = true;
    #   package = pkgs.nextcloud27;
    #   defaultPhoneRegion = "AU";
    #   nginx.hstsMaxAge = 31536000;
    #   database.createLocally = true;
    #   configureRedis = true;
    #   webfinger = true;
    #   maxUploadSize = "5000M";
    #   phpExtraExtensions = all: [ all.xdebug ];
    #   autoUpdateApps = {
    #     enable = true;
    #     startAt = "Sun 14:00:00";
    #   };
    #   caching = {
    #     #apcu = true;
    #     redis = true;
    #     #memcached = true;
    #   };
    #   config = {
    #     dbtype = "pgsql";
    #     dbname = "nextcloud";
    #     dbtableprefix = "oc_";
    #     dbpassFile = config.sops.secrets.nextcloud.db-password.path;
    #     dbuser = "nextcloud";
    #     dbhost = "/run/postgresql";
    #     dbport = "28943";
    #     adminuser = "nextcloudadmin";
    #     adminpassFile = config.sops.secrets.nextcloud.admin-password.path;
    #     #extraTrustedDomains = [
    #     #  "pim.devkid.net"
    #     #];
    #   };
    #   phpOptions = {
    #     # The OPcache interned strings buffer is nearly full with 8, bump to 16.
    #     catch_workers_output = "yes";
    #     display_errors = "stderr";
    #     error_reporting = "E_ALL & ~E_DEPRECATED & ~E_STRICT";
    #     expose_php = "Off";
    #     "opcache.enable_cli" = "1";
    #     "opcache.fast_shutdown" = "1";
    #     "opcache.interned_strings_buffer" = "16";
    #     "opcache.max_accelerated_files" = "10000";
    #     "opcache.memory_consumption" = "128";
    #     "opcache.revalidate_freq" = "1";
    #     #"openssl.cafile" = "/etc/ssl/certs/ca-certificates.crt";
    #     short_open_tag = "Off";

    #     "redis.session.locking_enabled" = "1";
    #     "redis.session.lock_retries" = "-1";
    #     "redis.session.lock_wait_time" = "10000";
    #   };
    #   poolSettings = {
    #     "pm" = "ondemand";
    #     "pm.max_children" = 32;
    #     "pm.process_idle_timeout" = "10s";
    #     "pm.max_requests" = 500;
    #   };
    #   extraOptions = {
    #       redis = {
    #         host = "127.0.0.1";
    #         port = 31638;
    #         dbindex = 0;
    #         timeout = 1.5;
    #       };
    #     };
    # };
    # nginx.virtualHosts."nextcloud.id3v1669.com" = {
    #   useACMEHost = "id3v1669.com";
    #   forceSSL = true;
    # };
    # postgresql = {
    #   enable = true;
    #   settings = {
    #     max_connections = "50";
    #     shared_buffers = "1280MB";
    #     effective_cache_size = "3840MB";
    #     maintenance_work_mem = "320MB";
    #     checkpoint_completion_target = "0.9";
    #     wal_buffers = "16MB";
    #     default_statistics_target = "100";
    #     random_page_cost = "4";
    #     effective_io_concurrency = "2";
    #     work_mem = "6553kB";
    #     huge_pages = "off";
    #     min_wal_size = "1GB";
    #     max_wal_size = "4GB";
    #   };
    # };
    # redis.servers.nextcloud = {
    #     enable = true;
    #     port = 31638;
    #     bind = "127.0.0.1";
    #   };
  } // lib.optionalAttrs (desk == "desktop" || desk == "laptop") {
    blueman.enable = true;
    printing.enable = true;
    flatpak.enable = true;
    hardware = {
      #openrgb = { ## broken.    rules and kernel modules install manually
      #  enable = true;
      #  motherboard = "${cpuvar}";
      #  package = pkgs.openrgb-with-all-plugins;
      #};
      bolt.enable = true;
    };
    pipewire = {
      enable = true;
      package = pkgs.pipewire;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
      jack.enable = true;
    };
  } // lib.optionalAttrs (envir == "gnome") {
    power-profiles-daemon.enable = false;
  } // lib.optionalAttrs (envir == "hypr") {
    gvfs.enable = true; # Mount, trash, etc
    mpd.enable = true;
    greetd = {
     enable = true;
     settings = {
       initial_session = {
         user = "${uservars.name}";
         command = "Hyprland";
       };
     };
    };
  } // lib.optionalAttrs (desk == "laptop") {
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          scaling_min_freq = 600000;
          scaling_max_freq = 1300000;
          turbo = "never";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };
  };
}
