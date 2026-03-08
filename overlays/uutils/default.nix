final: pkgs: {
  uutils-coreutils-noprefix = pkgs.uutils-coreutils-noprefix.overrideAttrs (old: rec {
    patches =
      (old.patches or [])
      ++ [
        ./mv.patch
      ];
  });
}
