{ hyprland, lib, config, pkgs, ... }:

{
  imports =[
    ./hw.nix
    ./../universal.nix
    ./../universalhypr.nix
  ];

  networking.hostName = "l14g3hypr";
  
  environment = {
    systemPackages = with pkgs; [
      #
    ];
    sessionVariables = {
      #
    };
  };
}
