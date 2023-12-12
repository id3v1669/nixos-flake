{ config, lib, ... }:

with lib;

{
  options.boot.loader.opencore = {
    enable = mkOption {
      default = false;

      type = types.bool;

      description = lib.mdDoc "Whether to enable the OpenCore EFI boot manager";
    };

    configurationLimit = mkOption {
      default = null;
      example = 120;
      type = types.nullOr types.int;
      description = lib.mdDoc ''
        Maximum number of latest generations in the boot menu.
        Useful to prevent boot partition running out of disk space.

        `null` means no limit i.e. all generations
        that were not garbage collected yet.
      '';
    };

    extraDrivers = mkOption {
      type = types.attrsOf types.path;
      default = {};
      example = literalExpression ''
        { "efi/memtest86/memtest.efi" = "''${pkgs.memtest86plus}/memtest.efi"; }
      '';
      description = lib.mdDoc ''
        A set of files to be copied to {file}`/boot`.
        Each attribute name denotes the destination file name in
        {file}`/boot`, while the corresponding
        attribute value specifies the source file.
      '';
    };

    tools = mkOption {
      type = types.attrsOf types.path;
      default = {};
      example = literalExpression ''
        { "efi/memtest86/memtest.efi" = "''${pkgs.memtest86plus}/memtest.efi"; }
      '';
      description = lib.mdDoc ''
        A set of files to be copied to {file}`/boot`.
        Each attribute name denotes the destination file name in
        {file}`/boot`, while the corresponding
        attribute value specifies the source file.
      '';
    };

    acpiTables = mkOption {
      type = types.attrsOf types.path;
      default = {};
      example = literalExpression ''
        { "" = "./DSDT.aml"; }
      '';
      description = lib.mdDoc ''
        A set of files to be copied to {file}`/boot`.
        Each attribute name denotes the destination file name in
        {file}`/boot`, while the corresponding
        attribute value specifies the source file.
      '';
    };

    extraInstallCommands = mkOption {
      default = "";
      example = ''
        default_cfg=$(cat /boot/loader/loader.conf | grep default | awk '{print $2}')
        init_value=$(cat /boot/loader/entries/$default_cfg | grep init= | awk '{print $2}')
        sed -i "s|@INIT@|$init_value|g" /boot/custom/config_with_placeholder.conf
      '';
      type = types.lines;
      description = lib.mdDoc ''
        Additional shell commands inserted in the bootloader installer
        script after generating menu entries. It can be used to expand
        on extra boot entries that cannot incorporate certain pieces of
        information (such as the resulting `init=` kernel parameter).
      '';
    };

    setting = mkOption {
      type = types.str;
      default = "default";
      description = "A custom setting for the boot feature.";
    };
  };

  config = mkIf config.boot.loader.myFeature.enable {
    # Here you define what happens when your feature is enabled
    # For instance, you could modify boot.kernelParams, set some system-wide settings, etc.
    boot.kernelParams = [ "my_feature_setting=${config.boot.loader.myFeature.setting}" ];
    # Additional configuration can go here
  };
}