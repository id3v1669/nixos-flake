{ bootloader
, ...
}: 
{
  boot.loader = {
    timeout = bootloader.timeout;
    systemd-boot = {
      enable = true;
      configurationLimit = 20;
    };
    efi.canTouchEfiVariables = true;
    grub.enable = false;
  };
}