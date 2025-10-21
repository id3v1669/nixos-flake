final: pkgs: {
  uutils-coreutils-noprefix = pkgs.uutils-coreutils-noprefix.overrideAttrs (old: rec {
    name = pkgs.coreutils.name;
  });
}
