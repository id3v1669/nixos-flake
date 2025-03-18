{
  config,
  pkgs,
  uservars,
  ...
}: {
  services = {
    httpd = {
      virtualHosts.main = {
        hostName = "${uservars.domain}";
        documentRoot = "/var/www/${uservars.domain}";
        listen = [
          {
            ip = "127.0.0.1";
            port = 8081;
          }
        ];
      };
    };
    nginx.virtualHosts = {
      "${uservars.domain}" = {
        enableACME = true;
        forceSSL = true;
        locations."/".proxyPass = "http://127.0.0.1:8081";
      };
    };
  };
}
