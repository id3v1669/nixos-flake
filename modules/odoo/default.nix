{uservars, ...}: let
  # Odoo (the ported k3-team database) is served on the apex of
  # id3v1669.org (owner decision 2026-09-20). This is deliberately not
  # uservars.domain (id3v1669.com), whose apex is Apache.
  odooHost = "id3v1669.org";
  odoo = {
    enableACME = true;
    forceSSL = true;
    extraConfig = ''
      client_max_body_size 50m;
    '';
    locations."/" = {
      proxyPass = "http://127.0.0.1:29069";
      recommendedProxySettings = true;
      extraConfig = ''
        proxy_read_timeout 30000s;
        proxy_redirect off;
      '';
    };
    locations."/websocket" = {
      proxyPass = "http://127.0.0.1:29072";
      recommendedProxySettings = true;
      proxyWebsockets = true;
    };
  };
in {
  services.nginx.virtualHosts = {
    "${odooHost}" = odoo;
    # Previous hostname: keep the certificate and redirect to the new one.
    "odoo.${uservars.domain}" = {
      enableACME = true;
      forceSSL = true;
      globalRedirect = odooHost;
    };
  };
}
