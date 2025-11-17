{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.boot.loader.systemd-boot;
  efi = config.boot.loader.efi;

  # Check the Python script with mypy
  checkedSource =
    pkgs.runCommand "bls-only-builder"
    {
      preferLocalBuild = true;
    }
    ''
      install -m755 -D ${./bls-only-builder.py} $out
      ${lib.getExe pkgs.buildPackages.mypy} \
        --no-implicit-optional \
        --disallow-untyped-calls \
        --disallow-untyped-defs \
        $out
    '';

  edk2ShellEspPath = "efi/edk2-uefi-shell/shell.efi";

  blsOnlyBuilderFinal = pkgs.replaceVarsWith {
    name = "bls-only-builder";
    dir = "bin";
    src = checkedSource;
    isExecutable = true;

    replacements = rec {
      inherit (builtins) storeDir;
      inherit (pkgs) python3;
      systemd = config.systemd.package;
      bootspecTools = config.boot.bootspec.package;
      nix = config.nix.package.out;
      configurationLimit =
        if cfg.configurationLimit == null
        then 0
        else cfg.configurationLimit;
      inherit (efi) efiSysMountPoint canTouchEfiVariables;
      bootMountPoint =
        if cfg.xbootldrMountPoint != null
        then cfg.xbootldrMountPoint
        else efi.efiSysMountPoint;
      nixosDir = "/EFI/nixos";
      inherit (config.system.nixos) distroName;

      checkMountpoints = pkgs.writeShellScript "check-mountpoints" ''
        fail() {
          echo "$1 = '$2' is not a mounted partition. Is the path configured correctly?" >&2
          exit 1
        }
        ${pkgs.util-linuxMinimal}/bin/findmnt ${efiSysMountPoint} > /dev/null || fail efiSysMountPoint ${efiSysMountPoint}
        ${
          lib.optionalString (cfg.xbootldrMountPoint != null)
          "${pkgs.util-linuxMinimal}/bin/findmnt ${cfg.xbootldrMountPoint} > /dev/null || fail xbootldrMountPoint ${cfg.xbootldrMountPoint}"
        }
      '';

      copyExtraFiles = pkgs.writeShellScript "copy-extra-files" ''
        empty_file=$(${pkgs.coreutils}/bin/mktemp)

        ${concatStrings (
          mapAttrsToList (n: v: ''
            ${pkgs.coreutils}/bin/install -Dp "${v}" "${bootMountPoint}/"${escapeShellArg n}
            ${pkgs.coreutils}/bin/install -D $empty_file "${bootMountPoint}/${nixosDir}/.extra-files/"${escapeShellArg n}
          '')
          cfg.extraFiles
        )}

        ${concatStrings (
          mapAttrsToList (n: v: ''
            ${pkgs.coreutils}/bin/install -Dp "${pkgs.writeText n v}" "${bootMountPoint}/loader/entries/"${escapeShellArg n}
            ${pkgs.coreutils}/bin/install -D $empty_file "${bootMountPoint}/${nixosDir}/.extra-files/loader/entries/"${escapeShellArg n}
          '')
          cfg.extraEntries
        )}
      '';
    };
  };

  finalBlsOnlyBuilder = pkgs.writeScript "install-bls-only.sh" ''
    #!${pkgs.runtimeShell}
    ${blsOnlyBuilderFinal}/bin/bls-only-builder "$@"
    ${cfg.extraInstallCommands}
  '';
in {
  meta.maintainers = with lib.maintainers; [];

  imports = [
    (
      mkRenamedOptionModule
      [
        "boot"
        "loader"
        "gummiboot"
        "enable"
      ]
      [
        "boot"
        "loader"
        "systemd-boot"
        "enable"
      ]
    )
    (
      lib.mkChangedOptionModule
      [
        "boot"
        "loader"
        "systemd-boot"
        "memtest86"
        "entryFilename"
      ]
      [
        "boot"
        "loader"
        "systemd-boot"
        "memtest86"
        "sortKey"
      ]
      (config: lib.strings.removeSuffix ".conf" config.boot.loader.systemd-boot.memtest86.entryFilename)
    )
    (
      lib.mkChangedOptionModule
      [
        "boot"
        "loader"
        "systemd-boot"
        "netbootxyz"
        "entryFilename"
      ]
      [
        "boot"
        "loader"
        "systemd-boot"
        "netbootxyz"
        "sortKey"
      ]
      (config: lib.strings.removeSuffix ".conf" config.boot.loader.systemd-boot.netbootxyz.entryFilename)
    )
  ];

  options.boot.loader.systemd-boot = {
    enable = mkOption {
      default = false;
      type = types.bool;
      description = ''
        Whether to generate BLS (Boot Loader Specification) entries compatible with systemd-boot,
        without installing systemd-boot itself. This is useful when using a different bootloader
        that can read BLS entries (e.g., rEFInd, custom bootloaders).

        This module generates entries in /boot/loader/entries/ and manages /boot/loader/loader.conf,
        but does not install or check for systemd-boot binaries.
      '';
    };

    sortKey = mkOption {
      default = "nixos";
      type = types.str;
      description = ''
        The sort key used for the NixOS bootloader entries.
        This key determines sorting relative to non-NixOS entries.
        See also <https://uapi-group.org/specifications/specs/boot_loader_specification/#sorting>
      '';
    };

    editor = mkOption {
      default = true;
      type = types.bool;
      description = ''
        Whether to allow editing the kernel command-line before boot.
        Note: This option writes to loader.conf but enforcement depends on your bootloader.
      '';
    };

    xbootldrMountPoint = mkOption {
      default = null;
      type = types.nullOr types.str;
      description = ''
        Where the XBOOTLDR partition is mounted.
        If set, this partition will be used to store boot loader entries and extra files
        instead of the EFI partition.
      '';
    };

    configurationLimit = mkOption {
      default = null;
      example = 120;
      type = types.nullOr types.int;
      description = ''
        Maximum number of latest generations in the boot menu.
        Useful to prevent boot partition running out of disk space.
        `null` means no limit.
      '';
    };

    installDeviceTree = mkOption {
      default = with config.hardware.deviceTree; enable && name != null;
      defaultText = ''with config.hardware.deviceTree; enable && name != null'';
      description = ''
        Install the devicetree blob specified by `config.hardware.deviceTree.name`.
      '';
    };

    extraInstallCommands = mkOption {
      default = "";
      example = ''
        default_cfg=$(cat /boot/loader/loader.conf | grep default | awk '{print $2}')
        # Custom post-processing here
      '';
      type = types.lines;
      description = ''
        Additional shell commands inserted in the bootloader installer
        script after generating menu entries.
      '';
    };

    consoleMode = mkOption {
      default = "keep";
      type = types.enum [
        "0"
        "1"
        "2"
        "5"
        "auto"
        "max"
        "keep"
      ];
      description = ''
        The resolution of the console (written to loader.conf).
      '';
    };

    memtest86 = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Make Memtest86+ available as a boot entry.
        '';
      };

      sortKey = mkOption {
        default = "o_memtest86";
        type = types.str;
        description = ''
          Sort key for Memtest86+ entry.
        '';
      };
    };

    netbootxyz = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Make netboot.xyz available as a boot entry.
        '';
      };

      sortKey = mkOption {
        default = "o_netbootxyz";
        type = types.str;
        description = ''
          Sort key for netboot.xyz entry.
        '';
      };
    };

    edk2-uefi-shell = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Make the EDK2 UEFI Shell available as a boot entry.
        '';
      };

      sortKey = mkOption {
        type = types.str;
        default = "o_edk2-uefi-shell";
        description = ''
          Sort key for EDK2 UEFI Shell entry.
        '';
      };
    };

    extraEntries = mkOption {
      type = types.attrsOf types.lines;
      default = {};
      example = literalExpression ''
        { "custom.conf" = '''
          title Custom Boot Entry
          efi /efi/custom/kernel.efi
          sort-key z_custom
        '''; }
      '';
      description = ''
        Any additional entries you want added to the boot menu.
        These entries will be copied to {file}`$BOOT/loader/entries`.
      '';
    };

    extraFiles = mkOption {
      type = types.attrsOf types.path;
      default = {};
      example = literalExpression ''
        { "efi/custom/kernel.efi" = ./my-kernel.efi; }
      '';
      description = ''
        A set of files to be copied to {file}`$BOOT`.
      '';
    };

    graceful = mkOption {
      default = false;
      type = types.bool;
      description = ''
        Graceful mode option (not used in BLS-only mode, kept for compatibility).
      '';
    };

    rebootForBitlocker = mkOption {
      default = false;
      type = types.bool;
      description = ''
        Enable BitLocker support flag in loader.conf.
      '';
    };

    windows = mkOption {
      default = {};
      description = ''
        Windows boot entries using EDK2 UEFI Shell.
      '';
      type = types.attrsOf (
        types.submodule (
          {name, ...}: {
            options = {
              efiDeviceHandle = mkOption {
                type = types.str;
                example = "HD0c3";
                description = ''
                  The device handle of the Windows ESP.
                '';
              };

              title = mkOption {
                type = types.str;
                example = "Windows 11";
                default = "Windows ${name}";
                defaultText = ''attribute name prefixed with "Windows "'';
                description = ''
                  The title of the boot menu entry.
                '';
              };

              sortKey = mkOption {
                type = types.str;
                default = "o_windows_${name}";
                defaultText = ''attribute name prefixed with "o_windows_"'';
                description = ''
                  Sort key for this Windows entry.
                '';
              };
            };
          }
        )
      );
    };
  };

  config = mkIf cfg.enable {
    assertions =
      [
        {
          assertion = hasPrefix "/" efi.efiSysMountPoint;
          message = "The ESP mount point '${toString efi.efiSysMountPoint}' must be an absolute path";
        }
        {
          assertion = cfg.xbootldrMountPoint == null || (hasPrefix "/" cfg.xbootldrMountPoint);
          message = "The XBOOTLDR mount point '${toString cfg.xbootldrMountPoint}' must be an absolute path";
        }
        {
          assertion = cfg.xbootldrMountPoint != efi.efiSysMountPoint;
          message = "The XBOOTLDR mount point cannot be the same as the ESP mount point";
        }
        {
          assertion = (config.boot.kernelPackages.kernel.features or {efiBootStub = true;}) ? efiBootStub;
          message = "This kernel does not support the EFI boot stub";
        }
        {
          assertion =
            cfg.installDeviceTree
            -> config.hardware.deviceTree.enable
            -> config.hardware.deviceTree.name != null;
          message = "Cannot install devicetree without proper configuration";
        }
      ]
      ++ concatMap (filename: [
        {
          assertion = !(hasInfix "/" filename);
          message = "boot.loader.systemd-boot.extraEntries.${lib.strings.escapeNixIdentifier filename} is invalid: entries within folders are not supported";
        }
        {
          assertion = hasSuffix ".conf" filename;
          message = "boot.loader.systemd-boot.extraEntries.${lib.strings.escapeNixIdentifier filename} is invalid: entries must have a .conf file extension";
        }
      ]) (builtins.attrNames cfg.extraEntries)
      ++ concatMap (filename: [
        {
          assertion = !(hasPrefix "/" filename);
          message = "boot.loader.systemd-boot.extraFiles.${lib.strings.escapeNixIdentifier filename} is invalid: paths must not begin with a slash";
        }
        {
          assertion = !(hasInfix ".." filename);
          message = "boot.loader.systemd-boot.extraFiles.${lib.strings.escapeNixIdentifier filename} is invalid: paths must not reference the parent directory";
        }
        {
          assertion = !(hasInfix "nixos/.extra-files" (toLower filename));
          message = "boot.loader.systemd-boot.extraFiles.${lib.strings.escapeNixIdentifier filename} is invalid: files cannot be placed in the nixos/.extra-files directory";
        }
      ]) (builtins.attrNames cfg.extraFiles)
      ++ concatMap (winVersion: [
        {
          assertion = lib.match "^[-_0-9A-Za-z]+$" winVersion != null;
          message = "boot.loader.systemd-boot.windows.${winVersion} is invalid: key must only contain alphanumeric characters, hyphens, and underscores";
        }
      ]) (builtins.attrNames cfg.windows);

    boot.loader.grub.enable = mkDefault false;

    boot.loader.supportsInitrdSecrets = true;

    boot.loader.systemd-boot.extraFiles = mkMerge [
      (mkIf cfg.memtest86.enable {
        "efi/memtest86/memtest.efi" = "${pkgs.memtest86plus.efi}";
      })
      (mkIf cfg.netbootxyz.enable {
        "efi/netbootxyz/netboot.xyz.efi" = "${pkgs.netbootxyz-efi}";
      })
      (mkIf (cfg.edk2-uefi-shell.enable || cfg.windows != {}) {
        edk2ShellEspPath = "${pkgs.edk2-uefi-shell}/shell.efi";
      })
    ];

    boot.loader.systemd-boot.extraEntries = mkMerge (
      [
        (mkIf cfg.memtest86.enable {
          "memtest86.conf" = ''
            title  Memtest86+
            efi    /efi/memtest86/memtest.efi
            sort-key ${cfg.memtest86.sortKey}
          '';
        })
        (mkIf cfg.netbootxyz.enable {
          "netbootxyz.conf" = ''
            title  netboot.xyz
            efi    /efi/netbootxyz/netboot.xyz.efi
            sort-key ${cfg.netbootxyz.sortKey}
          '';
        })
        (mkIf cfg.edk2-uefi-shell.enable {
          "edk2-uefi-shell.conf" = ''
            title  EDK2 UEFI Shell
            efi    /${edk2ShellEspPath}
            sort-key ${cfg.edk2-uefi-shell.sortKey}
          '';
        })
      ]
      ++ (mapAttrsToList (winVersion: cfg: {
          "windows_${winVersion}.conf" = ''
            title ${cfg.title}
            efi /${edk2ShellEspPath}
            options -nointerrupt -nomap -noversion ${cfg.efiDeviceHandle}:EFI\Microsoft\Boot\Bootmgfw.efi
            sort-key ${cfg.sortKey}
          '';
        })
        cfg.windows)
    );

    boot.bootspec.extensions."org.nixos.systemd-boot" = {
      inherit (config.boot.loader.systemd-boot) sortKey;
      devicetree = lib.mkIf cfg.installDeviceTree "${config.hardware.deviceTree.package}/${config.hardware.deviceTree.name}";
    };

    system = {
      build.installBootLoader = finalBlsOnlyBuilder;

      boot.loader.id = "systemd-boot";

      requiredKernelConfig = with config.lib.kernelConfig; [
        (isYes "EFI_STUB")
      ];
    };
  };
}
