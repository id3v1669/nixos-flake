{ pkgs
, ...
}: pkgs.vscode.overrideAttrs (oldAttrs: rec {
  name = "vscode";
  version = "1.88.1";
  src = pkgs.fetchurl {
    name = "code_x64_${version}.tar.gz";
    url = "https://update.code.visualstudio.com/${version}/linux-x64/stable";
    hash = "sha256-YnKo5jTWiulc8tmNm0XPizb+TfSGNNKuIuCEN/nhqZI=";
  };
})
