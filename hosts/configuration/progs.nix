{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, cpuvar, gpuvar, ...}: 
{
  programs = {
    gamemode.enable = true;
    light.enable = true;  #laptop brightness control and fix for openrgb
    noisetorch.enable = true;
    traceroute.enable = true;
    adb.enable = true;
    fish.enable = true;
  } // lib.optionalAttrs (envir == "gnome") {
    kdeconnect = {
      enable = true;
      package = pkgs.gnomeExtensions.gsconnect;
    };
  } // lib.optionalAttrs (envir == "hypr") {
    regreet.enable = true;
  };
  environment = {
    systemPackages = (with pkgs; [
      fish
    ]) ++ lib.lists.optionals (envir == "hypr")[
    ] ++ lib.lists.optionals (envir == "hypr") (with pkgs; [
      polkit_gnome
      xorg.xhost
      
      #virtualgl
      #virtualglLib
    ]);
  } // lib.optionalAttrs (envir == "gnome") {
    gnome.excludePackages = (with pkgs; [
    gnome-tour
    ]) ++ (with pkgs.gnome; [
      cheese # webcam tool
      gnome-music
      gnome-terminal
      epiphany # web browser
      geary # email reader
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
    ]);
  };
}
