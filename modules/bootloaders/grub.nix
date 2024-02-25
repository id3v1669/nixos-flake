{ bootloader
, ...
}:
{
  boot.loader = {
    timeout = bootloader.timeout;
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;
    grub = {
      device = "${bootloader.device}";
      enable = true;
      useOSProber = true;
    };
  };
}