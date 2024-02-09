{ pkgs
, ...
}: pkgs.vscode.overrideAttrs (oldAttrs: rec {
  name = "vscode";
  version = "1.86.0";
  src = pkgs.fetchurl {
    name = "code_x64_${version}.tar.gz";
    url = "https://update.code.visualstudio.com/${version}/linux-x64/stable";
    hash = "sha256-i8eLGs3ucsi/seeDX7zgnRizrwu63Edu9PQy0yBk02M=";
  };
})
