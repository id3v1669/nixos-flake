{lib, config, pkgs, bootloader, ...}: 
{
  boot.loader = {
    timeout = bootloader.timeout;
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    grub.enable = false;
  };
}