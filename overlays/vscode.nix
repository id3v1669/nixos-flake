{ pkgs
, ...
}: pkgs.vscode.overrideAttrs (oldAttrs: rec {
  version = "1.89.0";
  src = pkgs.fetchurl {
    name = "code_x64_${version}.tar.gz";
    url = "https://update.code.visualstudio.com/${version}/linux-x64/stable";
    hash = "sha256-vGDY57xMuEJrmJBwQ0ufnAKt1GR16jEDKt5/fva9wUM=";
  };
})
