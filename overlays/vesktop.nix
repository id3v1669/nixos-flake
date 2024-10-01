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
    rev = "d008f903995c802cb5addd99bd759878c8a3491a";
    hash = "sha256-oQr0k+0dOuJgwg51hr3O/OZoD66XOctQK82bu+MY+zE=";
  };
  
  pnpmDeps = oldAttrs.pnpmDeps.overrideAttrs (oldAttrs2: {
    outputHash = "sha256-Y55CeMKXZALes7X8uwsnFI6QVExHU8AbvU/gxCvTLHs=";
  });
})