{lib, config, pkgs, uservars, ...}: 
{
  networking = {
    nat = {
      enable = true;
      externalInterface = "ens3";
      internalInterfaces = [ "wg0" ];
    };
    #firewall.allowedUDPPorts = [ 51820 ];
    wireguard = {
      enable = true;
      interfaces.wg0 = {
        ips = [ "x.x.x.x/24" ];
        listenPort = 51820;
      };
    };
  };
}