{ stdenv
, fetchFromGitHub
, ...
}:stdenv.mkDerivation rec 
{
  pname = "OCConfig";
  version = "0.9.6";

  src = fetchFromGitHub ({
    owner = "id3v1669";
    repo = "ryzentosh-l14g3";
    rev = "ab68b5c9e263589c309e3ac310776da99f9917b9";
    hash = "sha256-q9klX1UUX0F20DNW8hD7riK/LvLAlVBvlBJQxHJEEpI=";
  });

  installPhase = ''
mkdir -p $out/ocpc
cp -r $src/* $out/ocpc
  '';
}