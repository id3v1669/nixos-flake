{ config, lib, pkgs, ... }:
let
  curversion = "23.05";
  uname = "user";
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz";
in
{
  imports = [
    ./hardware-configuration.nix
    ./../universal.nix
  ];
  boot.loader.grub = {
    enable = true;
    device = "/dev/vda";
    useOSProber = true;
  };
  networking.hostName = "vmnixos";
  services.xserver = {
    videoDrivers = [ "virtio" ];
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
  };
  environment.variables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_DRM_NO_ATOMIC = "1";
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
  };
}