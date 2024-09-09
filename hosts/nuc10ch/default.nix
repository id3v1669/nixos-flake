{ pkgs
, uservars
, curversion
, ...
}:
{
  imports = [ 
    ./hardware-configuration.nix
    ./../configuration.nix
    ./../../modules/sops.nix
    ./../../modules/virtualisation.nix
    ./../../modules/fonts.nix
    ./../../modules/security.nix
    ./../../modules/swhkd.nix
  ];

  networking = {
    useDHCP = false;
    interfaces.ens3.ipv4.addresses = [
      { address = "77.91.123.39"; prefixLength = 24; }
      { address = "77.91.123.50"; prefixLength = 24; }
    ];
    defaultGateway = "77.91.123.1";
    nameservers = [ "1.1.1.1" "8.8.8.8" ];
    firewall.allowedTCPPorts = [ 21669 26783 80 443 ];
    firewall.enable = true;
  };
  users.users = {
    ${uservars.name}.extraGroups = [
      "wheel"
      "networkmanager"
    ];
    guest = {
      isNormalUser = true;
      description = "guest user";
      shell = pkgs.fish;
      ignoreShellProgramCheck = true;
      extraGroups = [
        "networkmanager"
      ];
    };
  };
  services.openssh = {
    enable = true;
    ports = [ 26783 ];
    settings = {
      PermitRootLogin = "no";
    };
  };
  environment.variables = {
    #system vars
    EDITOR = "nano";
  };
  system.stateVersion = "${curversion}";
}