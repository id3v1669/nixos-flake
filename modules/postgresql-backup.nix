{...}: {
  services.postgresqlBackup = {
    enable = true;
    databases = ["vaultwarden"];
    startAt = "weekly";
  };
}
