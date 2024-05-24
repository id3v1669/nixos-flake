{ pkgs
, ...
}: pkgs.vscode.overrideAttrs (oldAttrs: rec {
  version = "1.89.1";
  src = pkgs.fetchurl {
    name = "code_x64_${version}.tar.gz";
    url = "https://update.code.visualstudio.com/${version}/linux-x64/stable";
    hash = "sha256-XXvdWkD0awbuImWiWY4+HE5Trb41lp89k1Dmax4i0P0=";
  };
})
