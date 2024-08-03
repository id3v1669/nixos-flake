{ config
, pkgs
, ...
}: 
{
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.defaultSession = "plasma";
  };
  environment.systemPackages = with pkgs; [
  ];
  environment.plasma6.excludePackages = with pkgs.kdePackages; [ ];
}