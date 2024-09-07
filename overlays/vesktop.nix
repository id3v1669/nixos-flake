{ pkgs
, ...
}: 
(pkgs.vesktop.override {
  electron = pkgs.electron;
}).overrideAttrs (oldAttrs: rec {
  postFixup = ''
    makeWrapper ${pkgs.electron}/bin/electron $out/bin/vesktop \
      --add-flags $out/opt/Vesktop/resources/app.asar
  '';
})