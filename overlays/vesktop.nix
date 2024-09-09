{ pkgs
, ...
}: 
(pkgs.vesktop.override {
  electron = (pkgs.electron-bin.overrideAttrs (oldAttrs1: rec {
    vers = "32.0.2";
    #vers = "33.0.0-alpha.3";
    fetcher = pkgs.fetchurl {
      url = "https://github.com/electron/electron/releases/download/v${vers}/electron-v${vers}-linux-x64.zip";
      sha256 = "sha256-rGFxNC38f7pK8S0sN5/UCJBKbZG2akHxzwanj8BCC0A=";
      #sha256 = "sha256-hH9rOPKIFYfWRqfiNk5tDkv7dDXusJbTOnyozRRYAZo=";
    };
  }));
}).overrideAttrs (oldAttrs: rec {
  # postFixup = ''
  #   makeWrapper ${pkgs.electron}/bin/electron $out/bin/vesktop \
  #     --add-flags $out/opt/Vesktop/resources/app.asar
  # '';
})