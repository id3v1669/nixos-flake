{ stdenv,
  fetchFromGitHub,
  cmake,
  pkg-config,
  qt5,
  extra-cmake-modules,
  pkgs
}: stdenv.mkDerivation rec
{
  pname = "rohrkabel";
  version = "1.3";

  src = fetchFromGitHub {
    owner = "Soundux";
    repo = "rohrkabel";
    rev = "v${version}";
    hash = "sha256-CpV+83ZGF+h8CpDTX2TcdZ2ahismvS8ezf/OZP4w7TQ=";
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    pkg-config
    qt5.wrapQtAppsHook
  ];

  buildInputs = [
    qt5.qtwebengine
    qt5.qtbase
    pkgs.pipewire
    pkgs.git
  ];
}