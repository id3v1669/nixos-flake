{ stdenv,
  fetchpatch,
  fetchFromGitLab,
  cmake,
  pkg-config,
  extra-cmake-modules,
  qt5,
  libsForQt5
}: stdenv.mkDerivation 
{
  pname = "xwaylandvideobridge";
  version = "unstable-2023-10-02";

  src = fetchFromGitLab {
    domain = "invent.kde.org";
    owner = "system";
    repo = "xwaylandvideobridge";
    rev = "9ee3d7a21ee3069e37a205318914f48b2b597eaa";
    hash = "sha256-v+CG2wFoClNuBiHFkC27DbfiZlWBMPLZt0g74/OsBMw=";
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    pkg-config
    qt5.wrapQtAppsHook
  ];

  buildInputs = [
    qt5.qtbase
    qt5.qtquickcontrols2
    qt5.qtx11extras
    libsForQt5.kdelibs4support
    libsForQt5.kpipewire
  ];
}
