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
    gvfs.enable = true;                         # Mount, trash, etc
    xserver = {
      desktopManager.plasma5.enable = true;     # plasma5
    };
  };
}