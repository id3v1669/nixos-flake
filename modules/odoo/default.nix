{...}: {
  services = {
    nginx.virtualHosts."odoo.id3v1669.com" = {
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
  };
}
