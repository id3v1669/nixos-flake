{ pkgs
, uservars
, ...
}:
{
  imports = [ 
    ./hardware-configuration.nix
    ./../configuration.nix
    #./../../modules/nginx.nix
  ];

  networking = {
    useDHCP = false;
    interfaces.ens3.ipv4.addresses = [
    ];
    #defaultGateway = "x.x.x.x";
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
}