{ pkgs
, ...
}:
(pkgs.clamav.overrideAttrs (oldAttrs: rec {
  version = "1.4.0";
  src = pkgs.fetchurl {
    url = "https://www.clamav.net/downloads/production/clamav-${version}.tar.gz";
    hash = "sha256-1nqymeXKBdrT2imaXqc9YCCTcqW+zX8TuaM8KQM4pOY=";
  };
}))