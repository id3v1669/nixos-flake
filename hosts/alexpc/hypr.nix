{ hyprland, lib, config, pkgs, ... }:

{
  imports =[
    ./hw.nix
    ./../universal.nix
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
