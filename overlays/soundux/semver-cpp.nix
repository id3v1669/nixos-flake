{ lib
, stdenvNoCC
, fetchFromGitHub
}:

stdenvNoCC.mkDerivation rec {
  pname = "semver-cpp";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "Neargye";
    repo = "semver";
    rev = "v${version}";
    sha256 = "sha256-nRWmY/GJtSkPJIW7i7/eIr/YtfyvYhJVZBRIDXUC7xg=";
  };
  dontBuild = true;
  installPhase = ''
    mkdir "$out"
    cp -r include "$out"
  '';
}