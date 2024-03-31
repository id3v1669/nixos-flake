{ lib
, stdenvNoCC
, fetchFromGitHub
}:

stdenvNoCC.mkDerivation rec {
  pname = "expected";
  version = "exu1";

  src = fetchFromGitHub {
    owner = "TartanLlama";
    repo = "expected";
    rev = "3f0ca7b19253129700a073abfa6d8638d9f7c80c";
    sha256 = "sha256-PZGL0w2TX+GdMm5QY/KwjV89icKN7TXOezQsXXsLyqQ=";
  };
  dontBuild = true;
  installPhase = ''
    mkdir "$out"
    cp -r * "$out"
  '';
}