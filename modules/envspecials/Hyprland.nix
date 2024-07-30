{ config
, pkgs
, ...
}: 
{
  programs.hyprland = {
    enable = true;
    package = pkgs.over-hyprland;
    portalPackage = pkgs.over-hypr-portal;
  };
  environment.systemPackages = with pkgs; [
  ];
}