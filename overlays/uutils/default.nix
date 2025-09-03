final: pkgs: {
  uutils-coreutils-noprefix = pkgs.uutils-coreutils-noprefix.overrideAttrs (old: rec {
    name = pkgs.coreutils.name;
    version = "0.1.0";
    src = pkgs.fetchFromGitHub {
      owner = "uutils";
      repo = "coreutils";
      rev = "1ed74336f5318c34fe40bb387a1282533df28068";
      hash = "sha256-yi4wOSKjLXnC3d4Hz3Ypij0Sebip1SePzasfXl923ts=";
    };
    cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
      inherit src;
      name = "uutils-coreutils-0.1.0-git";
      hash = "sha256-RNNreVPQI+APNFi7yxb0UiSnnpYwyaYLEAukH6zZir8=";
    };
    patches = [./make.patch];
  });
}
