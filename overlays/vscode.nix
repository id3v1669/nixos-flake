{ pkgs
, ...
}: pkgs.vscode.fhs.overrideAttrs (oldAttrs: rec {
  name = "vscode";
  version = "1.85.0";
  src = pkgs.fetchurl {
    name = "code_x64_${version}.tar.gz";
    url = "https://update.code.visualstudio.com/${version}/linux-x64/stable";
    hash = "sha256-ri5t3CLDLn+GX6oGoA0XEZQdzx2ykHlMbtZZ1aFBOXc=";
  };
})
