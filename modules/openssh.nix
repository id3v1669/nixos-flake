{lib, config, pkgs, ...}: 
{
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "yes";
    };
  };
}