{
  bootloader,
  lib,
  pkgs,
  ...
}: {
  boot.loader = {
    inherit (bootloader) timeout;
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
    grub.enable = lib.mkForce false;
  };
}
