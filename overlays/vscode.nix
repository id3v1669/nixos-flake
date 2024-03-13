{ pkgs
, ...
}: pkgs.vscode.overrideAttrs (oldAttrs: rec {
  name = "vscode";
  version = "1.87.2";
  src = pkgs.fetchurl {
    name = "code_x64_${version}.tar.gz";
    url = "https://update.code.visualstudio.com/${version}/linux-x64/stable";
    hash = "sha256-wul83GP/G8v7sQwie1OYYj0h8h5IcQj6HXQNq+fTeYU=";
  };
})
