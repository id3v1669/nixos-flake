final: pkgs: {
  uutils-coreutils-noprefix = pkgs.uutils-coreutils-noprefix.overrideAttrs (old: {
    patches =
      (old.patches or [])
      ++ [
        ./mv.patch
      ];
  });
  uutils-findutils = pkgs.uutils-findutils.overrideAttrs (old: {
    nativeBuildInputs = (old.nativeBuildInputs or []) ++ [pkgs.pkg-config];
    buildInputs = (old.buildInputs or []) ++ [pkgs.oniguruma];
  });
}
