{ pkgs
, gpuvar
, ...
}:
(pkgs.vesktop.override {
  electron = pkgs.electron;
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