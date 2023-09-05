{ hyprland, lib, config, pkgs, ... }:

{
  imports =[
    ./hw.nix
    ./../universal.nix
    ./../universalhypr.nix
  ];

  networking.hostName = "alexhypr";

  environment = {
    systemPackages = with pkgs; [
      #
    ];
    sessionVariables = {
      #
    };
  };
}
