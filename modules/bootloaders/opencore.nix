{
  bootloader,
  lib,
  pkgs,
  ...
}: {

  disabledModules = [ "system/boot/loader/systemd-boot/systemd-boot.nix" ];

  imports = [
    ./systemd-boot-bls-only.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.efi.canTouchEfiVariables = true;
}
