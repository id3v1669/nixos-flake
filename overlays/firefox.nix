{ pkgs
, ...
}:
(pkgs.firefox-bin-unwrapped.overrideAttrs (oldAttrs: rec {
  version = "130.0b9";
  src = pkgs.fetchurl {
    url = "https://download-installer.cdn.mozilla.net/pub/firefox/releases/${version}/linux-x86_64/en-GB/firefox-${version}.tar.bz2";
    sha256 = "sha256-e+v6cuIlSEtUbSjjaLFjmy+CNiHEnTIFkN9AiCmpvj8=";
  };
}))