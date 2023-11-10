{lib, config, pkgs, uservars, ...}:
{
  services = {
    nginx.virtualHosts."onlyoffice.id3v1669.com" = {
      enableACME = true;
      forceSSL = true;
    };
    onlyoffice = {
      enable = true;
      hostname = "onlyoffice.id3v1669.com";
    };
  };
}