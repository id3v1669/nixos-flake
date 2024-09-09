{ config
, uservars
, ...
}:
{
  services = {
    nginx.virtualHosts."vw.${uservars.domain}" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:1669";
      };
    };
  };
  virtualisation.oci-containers = {
    backend = "podman";
    containers."vaultwarden" = {
      autoStart = true;
      image = "vaultwarden/server:latest";
      ports = [
        "1669:80"
      ];
      volumes = [
        "/home/${uservars.name}/vaultwarden/vw-data/:/data/"
      ];
      environment = {
        EMERGENCY_ACCESS_ALLOWED = "false";
        SIGNUPS_ALLOWED = "false";
        DISABLE_ADMIN_TOKEN = "true";
        PASSWORD_HINTS_ALLOWED = "false";
        SHOW_PASSWORD_HINT = "false";
      };
    };
  };
}