{ hyprland, lib, config, pkgs, ... }:

{
  imports =[
    ./hw.nix
    ./../universal.nix
    ./../universalhypr.nix
  ];

  networking.hostName = "nuc11phhypr";
  
  environment = {
    systemPackages = with pkgs; [
      #
    ];
    sessionVariables = {
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME= "nvidia";
      LIBVA_DRIVER_NAME = "nvidia";
      NIXOS_OZONE_WL = "1";
    };
  };
}
