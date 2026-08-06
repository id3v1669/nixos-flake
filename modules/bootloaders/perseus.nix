{
  config,
  pkgs,
  bootloader,
  ...
}: {
  boot.loader = {
    inherit (bootloader) timeout;
    efi.canTouchEfiVariables = false;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      # writes EFI/BOOT/BOOTAA64.EFI (EDK2 loads this)
      efiInstallAsRemovable = true;
      configurationLimit = 20;
      # DTB delivery: GRUB's builder emits no `devicetree` line, so place the perseus
      # DTB on the ESP and load it into the EFI DTB config table
      extraFiles = {
        "perseus.dtb" = "${config.hardware.deviceTree.package}/${config.hardware.deviceTree.name}";
      };
      extraConfig = ''
        devicetree /perseus.dtb
      '';
      extraInstallCommands = ''
        cfg=/boot/grub/grub.cfg
        if [ -e "$cfg" ]; then
          ${pkgs.gawk}/bin/awk '
            !inflat && /^submenu .*All configurations.*\{/ { inflat=1; depth=1; next }
            inflat {
              n=gsub(/\{/,"{"); m=gsub(/\}/,"}");
              depth += n - m;
              if (depth <= 0) { inflat=0; next }
              print; next
            }
            { print }
          ' "$cfg" > "$cfg.flat" && ${pkgs.coreutils}/bin/mv "$cfg.flat" "$cfg"
        fi
      '';
    };
  };
}
