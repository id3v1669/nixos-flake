{ pkgs
, ...
}:
{
  security.acme = {
    defaults.email = "id3v1669@gmail.com";
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
    recommendedBrotliSettings = true;
    recommendedZstdSettings = true;
    sslCiphers = "AES256+EECDH:AES256+EDH:!aNULL";
  };
}