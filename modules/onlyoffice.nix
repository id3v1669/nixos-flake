_: {
  services = {
    nginx.virtualHosts."onlyoffice.id3v1669.com" = {
      enableACME = true;
      forceSSL = true;
    };
    onlyoffice = {
      enable = true;
      hostname = "onlyoffice.id3v1669.com";
      port = 8089;
    };
  };
}
