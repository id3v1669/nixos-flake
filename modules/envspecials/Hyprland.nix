{ config
, pkgs
, ...
}: 
{
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };
  environment.systemPackages = with pkgs; [
  ];
}