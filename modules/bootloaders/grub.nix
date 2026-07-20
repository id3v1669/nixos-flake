{bootloader, ...}: {
  boot.loader = {
    inherit (bootloader) timeout;
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;
    grub = {
      device = "${bootloader.device}";
      enable = true;
      useOSProber = true;
    };
  };
}
