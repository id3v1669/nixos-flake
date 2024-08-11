{ pkgs
, ...
}:
(pkgs.firefox-bin-unwrapped.overrideAttrs (oldAttrs: rec {
  version = "129.0";
  src = pkgs.fetchurl {
    url = "https://download-installer.cdn.mozilla.net/pub/firefox/releases/${version}/linux-x86_64/en-GB/firefox-${version}.tar.bz2";
    sha256 = "sha256-zdNgtrVdHDpjTSoynfLSHum97zG0CUrWeBRiXY3cXsU=";
  };
}))