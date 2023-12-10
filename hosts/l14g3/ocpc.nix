{ lib
, stdenv
, fetchurl
, unzip
, fetchFromGitHub
, ...
}:stdenv.mkDerivation rec 
{
  pname = "OCConfig";
  version = "0.9.6";

  src = fetchFromGitHub ({
    owner = "id3v1669";
    repo = "ryzentosh-l14g3";
    rev = "d22958ab9252f8b79031bf28b488d96f688be1e6";
    hash = "sha256-OEsPPiD+Bs6StrGjBtln0iORXwPlmhCxbQftSRaLD0w=";
  });

  installPhase = ''
mkdir -p $out/ocpc
cp -r $src/* $out/ocpc
  '';
}