{
  pkgs,
  lib,
  uservars,
  ...
}: {
  imports = [
    /etc/nixos/net.nix
    ./hardware-configuration.nix
    ./../configuration.nix
    ./../../modules/nginx.nix
    ./../../modules/httpd.nix
    ./../../modules/web.nix
    ./../../modules/sops.nix
    ./../../modules/vaultwarden.nix
    ./../../modules/postgresql-backup.nix
    ./../../modules/dufs.nix
    ./../../modules/minecraft.nix
    ./../../modules/virtualisation.nix
    ./../../modules/fonts.nix
    ./../../modules/security.nix
  ];

  zramSwap.enable = true;
  services.scx-loader.config.default_mode = lib.mkForce "Server";

  networking = {
    useDHCP = false;
    firewall.enable = true;
  };
  users.users = {
    ${uservars.name} = {
      linger = true;
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
    };
  };
  services.openssh = {
    enable = true;

    settings = {
      PermitRootLogin = "no";
    };
  };
  environment.variables = {
    #system vars
    EDITOR = "nano";
  };
}
