{ config
, pkgs
, ...
}: 
{
  security.polkit.enable = true;
  xdg.portal = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
  ];
  services = {
    xserver = {
      desktopManager.plasma5.enable = true;     # plasma5
    };
  };
}