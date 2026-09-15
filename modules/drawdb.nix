{
  inputs,
  config,
  uservars,
  ...
}: {
  imports = [
    inputs.drawdb.nixosModules.default
  ];

  sops.secrets.drawdb-tokens = {
    sopsFile = ./../secrets/system/drawdb.enc.yaml;
    restartUnits = ["drawdb.service" "drawdb-mcp.service"];
  };

  services.drawdb = {
    enable = true;
    port = 3001;
    allowedOrigins = ["https://drawdb.${uservars.domain}"];
    tokensFile = config.sops.secrets.drawdb-tokens.path;
    backup = true;
    startAt = "daily";
    backupPath = "/var/backup/drawdb";
    backupsLimit = 10;
    mcp = {
      enable = true;
      port = 3002;
      allowedHosts = ["drawdb.${uservars.domain}"];
    };
  };

  services.nginx.virtualHosts."drawdb.${uservars.domain}" = {
    enableACME = true;
    forceSSL = true;
    locations."/".proxyPass = "http://127.0.0.1:3001";
    locations."/ws/" = {
      proxyPass = "http://127.0.0.1:3001";
      proxyWebsockets = true;
      extraConfig = ''
        access_log off;
        proxy_read_timeout 3600s;
      '';
    };
    locations."= /mcp" = {
      proxyPass = "http://127.0.0.1:3002";
      extraConfig = ''
        proxy_http_version 1.1;
        proxy_buffering off;
        proxy_read_timeout 3600s;
      '';
    };
  };
}
