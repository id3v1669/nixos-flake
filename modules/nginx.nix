{lib, config, pkgs, uservars, ...}:
{
  security.acme = {
    defaults.email = "nico@nico.ni";
    acceptTerms = true;
  };
  services.nginx = {
    enable = true;
  };
}