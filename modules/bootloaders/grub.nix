{ bootloader
, ...
}:
{
  boot.loader = {
    timeout = bootloader.timeout;
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;
    grub = {
      devices = [ "${bootloader.device}" ];
      enable = true;
      efiSupport = true;
    };
  };
}