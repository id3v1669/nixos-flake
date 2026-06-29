final: pkgs: {
  uutils-coreutils-noprefix = pkgs.uutils-coreutils-noprefix.overrideAttrs (old: rec {
    pname = "uutils-coreutils-noprefix";
    version = "0.9.0";
    src = pkgs.fetchFromGitHub {
      owner = "uutils";
      repo = "coreutils";
      rev = "4bc3b683d856b14005f76f66a3270b698d0ee10b";
      hash = "sha256-UGuaq+qjW+6ZyFnk/FOQA1uUGti5zYJqGUShwJF+Wl0=";
    };
    cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
      inherit pname src version;
      hash = "sha256-sTI2PxwdXAurIZu6aYhgy5Okk6NyHaM3jsz9sFCcgBs=";
    };
    patches =
      (old.patches or [])
      ++ [
        ./mv.patch
      ];
  });
}
