{lib, config, pkgs, uservars, ...}:
{
  services = {
    nginx.virtualHosts."vw.${uservars.domain}" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}";
      };
    };
    vaultwarden = {
      enable = true;
      dbBackend = "postgresql";
      config = {
        DOMAIN = "https://vw.${uservars.domain}";
        SIGNUPS_ALLOWED = false;
        ROCKET_ADDRESS = "127.0.0.1";
        ROCKET_PORT = 8222;
        ROCKET_LOG = "critical";
        IP_HEADER = "X-Real-IP";
        PASSWORD_HINTS_ALLOWED = false;
        SHOW_PASSWORD_HINT = false;
        USE_SYSLOG = true;
      };
    };
  };
}