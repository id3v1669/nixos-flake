final: pkgs: {
  uutils-coreutils-noprefix = pkgs.uutils-coreutils-noprefix.overrideAttrs (old: rec {
    pname = "uutils-coreutils-noprefix";
    version = "0.8.0";
    src = pkgs.fetchFromGitHub {
      owner = "uutils";
      repo = "coreutils";
      rev = "a1599dfad40be97e471f9644dcc41b5c5a41265a";
      hash = "sha256-WM0usHF8zzpXWlfmKA//AscI4KBgTSY7TIMzo6JUTAY=";
    };
    cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
      inherit pname src version;
      hash = "sha256-oFai+JRE7n9epv4d3V3D4EUcUd2sH6QudVbLWRnXdpw=";
    };
    patches =
      (old.patches or [])
      ++ [
        ./mv.patch
      ];
  });
}
