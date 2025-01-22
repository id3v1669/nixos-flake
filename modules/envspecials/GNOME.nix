{ config
, pkgs
, ...
}: 
{
  services = {
    xserver.desktopManager.gnome.enable = true;
  };
  environment.systemPackages = with pkgs; [

  ];
  environment.gnome.excludePackages = with pkgs; [ ];
}