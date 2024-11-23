{ pkgs
, ...
}:
(pkgs.equibop.override {
  electron = pkgs.electron;
}).overrideAttrs (oldAttrs: rec {
  version = "2.1.1";
  src = oldAttrs.src.override {
    rev = "eccfc36703d7cc14aca2b99d710047ad9612a5fa";
    hash = "sha256-Kzjy4c3yMFDAXsasR4tIjQKpqlexiQBP+IcaOUxruj4=";
  };
  
  pnpmDeps = oldAttrs.pnpmDeps.overrideAttrs (oldAttrs2: {
    outputHash = "sha256-dIz/HyhzFU86QqQEQ9qWSthKB9HfoRJbmpc3raWNbcA=";
  });

  postFixup = ''
    makeWrapper ${pkgs.electron}/bin/electron $out/bin/equibop \
      --add-flags $out/opt/Equibop/resources/app.asar \
      --add-flags "--enable-features=VaapiIgnoreDriverChecks,VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization,UseMultiPlaneFormatForHardwareVideo,VaapiVideoDecodeLinuxGL,enable-zero-copy,ignore-gpu-blacklist,ignore-gpu-blocklist,disable-gpu-driver-bug-workaround"
  '';
})