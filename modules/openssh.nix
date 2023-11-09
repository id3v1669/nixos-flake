{lib, config, pkgs, ...}: 
{
  openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "yes";
    };
  };
}