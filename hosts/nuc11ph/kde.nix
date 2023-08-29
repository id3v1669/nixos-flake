{ hyprland, lib, config, pkgs, ... }:

{
  imports =[
    ./hw.nix
    ./../universal.nix
  ];

  security.polkit.enable = true;
  programs.dconf.enable = true;

  services.xserver = {
    enable = true;
    displayManager = {
      sddm.enable = true;
 #     defaultSession = "plasmawayland";
    };
    desktopManager.plasma5.enable = true;
  };

#  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
#    elisa 
#    #gwenview #image viewer
#    okular #pdf and doc viewer
#    oxygen
#    khelpcenter
#    konsole
#    plasma-browser-integration
#    #print-manager
#  ];
}
