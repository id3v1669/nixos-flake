{ stdenv,
  fetchFromGitHub,
  fetchFromGitLab,
  cmake,
  pkg-config,
  extra-cmake-modules,
  qt5,
  qt6,
  libsForQt5
}: stdenv.mkDerivation 
{
  pname = "xwaylandvideobridge";
  version = "unstablegit-2023-09-05";

  src = fetchFromGitHub {
    owner = "idev1669";
    repo = "xwaylandvideobridge";
    rev = "d6d7aeebe1e073044e2dfe9d8f0047915a312aad";
    sha256 = "0fc5ba6fdx4sky1d0afw6qaiykb746618qp8q05hwfjsssrc8g8w";
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
    (libsForQt5.kpipewire.overrideAttrs (oldAttrs: {
      version = "unstable-2023-09-06";

      src = fetchFromGitLab {
        domain = "invent.kde.org";
        owner = "plasma";
        repo = "kpipewire";
        rev = "8d097a4d1c1dbea2d4fe41f4c1aeb4d056ad8b4c";
        sha256 = "1q6m9w8chvld5jyrh88f6c3yiy4wiaqnpqg7wba7f3gzrf4njbsh";
      };
    }))
  ];
}
