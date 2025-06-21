{
  bootloader,
  lib,
  pkgs,
  ...
}: {
  boot.loader = {
    inherit (bootloader) timeout;
    limine = {
      enable = true;
      secureBoot.enable = true;
      maxGenerations = 10;
    };
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = false;
    grub.enable = lib.mkForce false;
  };
}
