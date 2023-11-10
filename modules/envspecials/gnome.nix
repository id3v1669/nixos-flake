{lib, config, pkgs, uservars, ...}: 
{
  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };
  environment.gnome.excludePackages = (with pkgs; [
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
  services = {
    xserver = {
      desktopManager.gnome = {
        enable = true;
        debug = false;
      };
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };
    power-profiles-daemon.enable = false;   
  };
}