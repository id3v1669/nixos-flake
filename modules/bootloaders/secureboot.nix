{
  bootloader,
  lib,
  pkgs,
  config,
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
  system.activationScripts.signEfi = {
    text = ''
      for file in /boot/EFI/nixos/*bzImage.efi; do
        if [ -e "$file" ]; then
          ${pkgs.sbctl}/bin/sbctl sign "$file"
        fi
      done
    '';
  };
  environment.systemPackages = [
    pkgs.sbctl
  ];
}
