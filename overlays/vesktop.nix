{ pkgs
, gpuvar
, ...
}:
(pkgs.vesktop.override {
  #electron = pkgs.electron;
  electron = (pkgs.electron-bin.overrideAttrs (oldAttrs1: rec {
    vers = "34.0.0-alpha.5";
    fetcher = pkgs.fetchurl {
      url = "https://github.com/electron/electron/releases/download/v${vers}/electron-v${vers}-linux-x64.zip";
      sha256 = "sha256-wZ96zW2vR8mGpQEJKMnohXgVxywhuv2zI+pgDW5U44k=";
    };
  }));
}).overrideAttrs (oldAttrs: rec {
  postFixup = ''
    makeWrapper ${pkgs.electron}/bin/electron $out/bin/vesktop \
      --add-flags $out/opt/Vesktop/resources/app.asar
  '';
  version = "1.5.3";
  src = oldAttrs.src.override {
    rev = "03c7ad4cc00970e970960340b55ad32d3f2643f2";
    hash = "sha256-Eg0j0Cr5Ibn6QisYKZXwOzll0Lbd8uw66mInck0if0c=";
  };
  
  pnpmDeps = oldAttrs.pnpmDeps.overrideAttrs (oldAttrs2: {
    outputHash = "sha256-IIR1iz/Un24/cv/kexRaV0lqFmnEAgXsIyQYOZUCVqI=";
  });
})