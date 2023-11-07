{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, cpuvar, gpuvar, desk, ...}: 
{
  programs = {
    fish.enable = true;
  } // lib.optionalAttrs (desk == "server") {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  } // lib.optionalAttrs (desk == "desktop" || desk == "laptop") {
    gamemode.enable = true;
    wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };
    light.enable = true;  #laptop brightness control and fix for openrgb
    noisetorch.enable = true;
    traceroute.enable = true;
    adb.enable = true;
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
    ]) ++ lib.lists.optionals (envir == "hypr") (with pkgs; [
      polkit_gnome
      xorg.xhost
      uwufetch #broken under hm
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
