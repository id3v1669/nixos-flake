{ lib
, stdenvNoCC
, fetchFromGitHub
, pkgs
}:
let
  expected = (pkgs.callPackage ./expected.nix {});
in
stdenvNoCC.mkDerivation rec {
  pname = "guardpp";
  version = "unstable-2021-04-08";

  src = fetchFromGitHub {
    owner = "Soundux";
    repo = "guardpp";
    rev = "59a29ea3437e06d38a3d64ea2230d022b0294f0d";
    hash = "sha256-I9cpeW2PtT6ydRyLUlrHx5ELKNuIkPbIbRt4KU53wsk=";
  };

  postPatch = ''
    substituteInPlace CMakeLists.txt \
      --replace-quiet "FetchContent_Declare(expected GIT_REPOSITORY \"https://github.com/TartanLlama/expected\")" \
        "FetchContent_Declare(expected SOURCE_DIR \"${expected}\")"

    sed -i '/target_link_libraries(''${PROJECT_NAME} PUBLIC tl::expected)/i add_library(tl::expected ALIAS expected)' CMakeLists.txt
  '';

  dontBuild = true;
  installPhase = ''
    mkdir "$out"
    cp -r * "$out"
  '';

  propagatedBuildInputs = [ expected ];
}