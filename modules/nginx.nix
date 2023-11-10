{lib, config, pkgs, uservars, ...}:
{
  security.acme = {
    defaults.email = "nico@nico.ni";
    acceptTerms = true;
  };
  services.nginx = {
    enable = true;
    package = pkgs.nginx;
    sslProtocols = "TLSv1.3";
    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedGzipSettings = true;
    sslCiphers = "AES256+EECDH:AES256+EDH:!aNULL";
    commonHttpConfig = ''
      charset utf-8;
      map $scheme $hsts_header {
        https "max-age=31536000; includeSubdomains; preload";
      }
      add_header Strict-Transport-Security $hsts_header;
      add_header 'Referrer-Policy' 'same-origin';
      add_header X-Frame-Options DENY;
      add_header X-Content-Type-Options nosniff;
      add_header X-XSS-Protection "1; mode=block";
    '';
  };
}