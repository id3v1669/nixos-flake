{ bootloader
, lib
, pkgs
, ...
}: 
{
  boot.loader = {
    timeout = bootloader.timeout;
    systemd-boot = {
      enable = lib.mkForce false;
      configurationLimit = 20;
    };
    efi.canTouchEfiVariables = true;
    grub.enable = lib.mkForce false;
  };
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };
  environment.systemPackages = [
    pkgs.sbctl
  ];
}