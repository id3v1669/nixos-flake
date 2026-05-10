{
  lib,
  pkgs,
  deflocale,
  uservars,
  hostname,
  envir,
  curversion,
  bootloader,
  colorsvar,
  ...
}: {
  imports = [
    ./../modules/envspecials/${envir}.nix
    ./../modules/bootloaders/${bootloader.type}.nix
    ./../modules/fish.nix
    ./../modules/ox.nix
  ];
  palette = "${colorsvar}";
  networking = {
    hostName = "${hostname}${envir}";
    networkmanager.enable = true;

    useDHCP = lib.mkDefault true;
    enableIPv6 = lib.mkDefault true;
  };
  programs = {
    nano.enable = true;
    direnv = {
      enable = true;
      loadInNixShell = false;
      nix-direnv.enable = true;
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-all;
    };
  };
  users.users.${uservars.name} = {
    isNormalUser = true;
    description = "${uservars.description}";
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
  };
  environment.systemPackages = with pkgs; [
    eza
    killall
  ];
  time.timeZone = "${deflocale.timezone}";
  i18n.defaultLocale = "${deflocale.locale}";
  nix = {
    settings = {
      experimental-features = ["flakes" "nix-command"];
      warn-dirty = false;
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  services = {
    scx = {
      enable = true;
      scheduler = "scx_rusty";
    };
    xserver = {
      enable = true;
      xkb = {
        variant = "${deflocale.kbvariant}";
        options = "${deflocale.kboption}";
        layout = "${deflocale.kblayout}";
      };
    };
  };
  system.stateVersion = "${curversion}";
  systemd.services.mandb.enable = false;

  system.replaceDependencies.replacements = let
    coreutils-full-name =
      "coreuutils-full"
      + builtins.concatStringsSep ""
      (builtins.genList (_: "_") (builtins.stringLength pkgs.coreutils-full.version));

    coreutils-name =
      "coreuutils"
      + builtins.concatStringsSep ""
      (builtins.genList (_: "_") (builtins.stringLength pkgs.coreutils.version));

    findutils-name =
      "finduutils"
      + builtins.concatStringsSep ""
      (builtins.genList (_: "_") (builtins.stringLength pkgs.findutils.version));

    diffutils-name =
      "diffuutils"
      + builtins.concatStringsSep ""
      (builtins.genList (_: "_") (builtins.stringLength pkgs.diffutils.version));
  in [
    {
      oldDependency = pkgs.coreutils-full;
      newDependency = pkgs.symlinkJoin {
        name = coreutils-full-name;
        paths = [pkgs.uutils-coreutils-noprefix];
      };
    }
    # bug, triggers reach rebuild and boot following:
    # mv: replace '/bin/sh', overriding mode 0555 (r-xr-xr-x)?
    # right now rough patch to make Force the default option
    {
      oldDependency = pkgs.coreutils;
      newDependency = pkgs.symlinkJoin {
        name = coreutils-name;
        paths = [pkgs.uutils-coreutils-noprefix];
      };
    }
    {
      oldDependency = pkgs.findutils;
      newDependency = pkgs.symlinkJoin {
        name = findutils-name;
        paths = [pkgs.uutils-findutils];
      };
    }
    {
      oldDependency = pkgs.diffutils;
      newDependency = pkgs.symlinkJoin {
        name = diffutils-name;
        paths = [pkgs.uutils-diffutils];
      };
    }
  ];
}
