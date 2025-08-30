final: pkgs: {
  uutils-coreutils-noprefix = pkgs.uutils-coreutils-noprefix.overrideAttrs (old: rec {
      name = pkgs.coreutils.name;
      version = "0.1.0";
      src = pkgs.fetchFromGitHub {
        owner = "id3v1669";
        repo = "coreutils";
        rev = "c3a1fdfb7b5c05d228bd220bc3c783dc59e3a6c9";
        hash = "sha256-nfuDhAGkgBrmfLySFzrh10Lq3eG0MCEieOedEu6E03M=";
      };
      cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
        inherit src;
        name = "uutils-coreutils-0.1.0-git";
        hash = "sha256-ByUajYK+xAq93f3jn0oufV8GBtoliozLzsKcepAYkMA=";
      };
      patches = [ ./make.patch ];
    });
}
