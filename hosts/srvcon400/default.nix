{
  pkgs,
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
    ./../../modules/dufs.nix
    ./../../modules/wireguard.nix
    ./../../modules/virtualisation.nix
    ./../../modules/fonts.nix
    ./../../modules/security.nix
  ];

  networking = {
    useDHCP = false;
    firewall.enable = true;
  };
  users.users = {
    ${uservars.name}.extraGroups = [
      "wheel"
      "networkmanager"
    ];
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
