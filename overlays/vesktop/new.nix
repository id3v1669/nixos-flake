{ pkgs
, ...
}: 
let
  vencord = pkgs.vencord.overrideAttrs (old: {
    src = pkgs.fetchFromGitHub {
      owner = "Vendicated";
      repo = "Vencord";
      rev = "v1.7.3";
      hash = "sha256-BsM7Gt1NEsZu/rxK58+Tix1xIJr6RvgbdjxVnro2soA=";
    };
  });
in
pkgs.vesktop.overrideAttrs (oldAttrs: rec {
  pname = "vesktop";
  version = "1.5.1";
  src = pkgs.fetchFromGitHub {
    owner = "Vencord";
    repo = "Vesktop";
    rev = "v1.5.1";
    hash = "sha256-27998q9wbaNP1xYY+KHTBeJRfR6Q/K0LNdbRb3YHC6c=";
  };
  patches = [
    (pkgs.substituteAll { inherit vencord; src = ./use_system_vencord.patch; })
  ];
  pnpmDeps = oldAttrs.pnpmDeps.overrideAttrs (oldAttrs2: {
        outputHash = "sha256-y7lOkFNcsJlRCiTdTb5AW4a5WXov2+bYyHjuXJHAubQ=";
      });
})
