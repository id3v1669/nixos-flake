{ lib
, stdenv
, fetchurl
, unzip
, fetchFromGitHub
, ...
}:stdenv.mkDerivation rec 
{
  pname = "opencore";
  version = "0.9.6";

  src = fetchurl rec {
    url = "https://github.com/acidanthera/OpenCorePkg/releases/download/${version}/OpenCore-${version}-RELEASE.zip";
    hash = "sha256-biKbC6GuIagv/IhagwnHyG/nGJHoDXfe0ztAKNm6Log=";
  };

  bdata = fetchFromGitHub ({
    owner = "acidanthera";
    repo = "OcBinaryData";
    rev = "ab68b5c9e263589c309e3ac310776da99f9917b9";
    hash = "sha256-q9klX1UUX0F20DNW8hD7riK/LvLAlVBvlBJQxHJEEpI=";
  });

  dontUnpack = true;

  nativeBuildInputs = [ unzip ];

  installPhase = ''
mkdir -p $out/ocpkg
mkdir -p $out/ocbinaryData
${unzip}/bin/unzip $src -d $out/ocpkg
cp -r $bdata/* $out/ocbinaryData
  '';
}