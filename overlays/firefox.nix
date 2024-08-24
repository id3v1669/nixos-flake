{ pkgs
, ...
}:
(pkgs.firefox-bin-unwrapped.overrideAttrs (oldAttrs: rec {
  version = "130.0b8";
  src = pkgs.fetchurl {
    url = "https://download-installer.cdn.mozilla.net/pub/firefox/releases/${version}/linux-x86_64/en-GB/firefox-${version}.tar.bz2";
    sha256 = "sha256-S7Qj3Jk1Z58J0FLiP3Y3aIvdg1AD+GrW/1WINelq65I=";
  };
}))