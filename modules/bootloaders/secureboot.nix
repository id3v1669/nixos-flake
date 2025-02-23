{ bootloader
, lib
, pkgs
, config
, ...
}: 
{
  boot.loader = {
    timeout = bootloader.timeout;
    systemd-boot.enable = lib.mkForce false;
    efi.canTouchEfiVariables = true;
    grub.enable = lib.mkForce false;
  };
  boot.lanzaboote = {
    enable = true;
    configurationLimit = 15;
    pkiBundle = "/var/lib/sbctl";
    settings = {
      timeout = 10;
      console-mode = "auto";
      editor = config.boot.loader.systemd-boot.editor;
      default = "nixos-*";
    };
  };
  environment.systemPackages = [
    pkgs.sbctl
  ];
}