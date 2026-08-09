{nixpkgs}: let
  pkgs = import nixpkgs {
    #TODO fix for arm host
    localSystem = "x86_64-linux";
    crossSystem = "aarch64-linux";
  };
in
  (pkgs.linuxManualConfig {
    version = "7.1.0-rc1";
    modDirVersion = "7.1.0-rc1-sdm845";
    src = pkgs.fetchzip {
      url = "https://gitlab.com/sdm845-mainline/linux/-/archive/sdm845-7.1-rc1-r0/linux-sdm845-7.1-rc1-r0.tar.gz";
      sha256 = "1mximw1c1lksr52rffs1snl9l3s77glfy7h54h6ljkmafh9gibpw";
    };
    configfile = ./kernel-config.aarch64;
    allowImportFromDerivation = true;
  }).overrideAttrs (old: {
    patches =
      (old.patches or [])
      ++ [
        ./patches/perseus-dts-otg.patch
        ./patches/pmi8998-usbpd.patch
        ./patches/perseus-bt-local-bd-address.patch
      ];
  })
