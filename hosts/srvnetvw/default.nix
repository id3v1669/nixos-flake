{ config, lib, pkgs, modulesPath, uservars, curversion, ... }:
{
  imports = [ 
    ./hardware-configuration.nix
    ./../configuration.nix
    #./../../modules/nginx.nix
  ];

  networking = {
    useDHCP = false;
    interfaces.ens3.ipv4.addresses = [
      { address = "193.38.54.30"; prefixLength = 24; }
      { address = "193.38.54.47"; prefixLength = 24; }
      { address = "193.38.54.49"; prefixLength = 24; }
      { address = "193.38.54.60"; prefixLength = 24; }
    ];
    defaultGateway = "193.38.54.1";
    nameservers = [ "1.1.1.1" "8.8.8.8" ];
    #firewall.allowedTCPPorts = [ 26783 80 443 ];
    firewall.enable = false;
  };
  users.users.${uservars.name}.extraGroups = [ 
    "wheel"
    "networkmanager"
  ];
  services.openssh = {
    enable = true;
    #ports = [ 26783 ];
    settings = {
      PermitRootLogin = "yes";
    };
  };
  environment.variables = {
    #system vars
    EDITOR = "nano";
  };
  system.stateVersion = "${curversion}";
}