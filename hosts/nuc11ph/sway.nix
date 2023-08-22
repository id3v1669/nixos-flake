{ hyprland, lib, config, pkgs, ... }:

{
  imports =[
    ./hw.nix
    ./../universal.nix
  ];

  security = {
    polkit.enable = true;
  };
  

  programs.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    enableNvidiaPatches = true;
  };

  programs = {
    regreet = {
      enable = true;
    };
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
  };
  services = {
    xserver = {
      enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };
  };
  
  environment.systemPackages = with pkgs; [
    
  ];
}
