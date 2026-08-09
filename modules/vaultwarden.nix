{uservars, ...}: {
  services = {
    nginx.virtualHosts."vw.${uservars.domain}" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:8222";
      };
    };
    vaultwarden = {
      enable = true;
      dbBackend = "postgresql";
      configurePostgres = true;
      config = {
        DOMAIN = "https://vw.${uservars.domain}";
        ROCKET_ADDRESS = "127.0.0.1";
        ROCKET_PORT = 8222;
        SIGNUPS_ALLOWED = false;
        EMERGENCY_ACCESS_ALLOWED = false;
        PASSWORD_HINTS_ALLOWED = false;
        SHOW_PASSWORD_HINT = false;
      };
    };
  };
}
