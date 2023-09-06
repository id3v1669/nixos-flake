{ stdenv
, fetchFromGitLab
, cmake
, pkg-config
, extra-cmake-modules
, qt5
, libsForQt5
}: stdenv.mkDerivation {
  pname = "xwaylandvideobridge";
  version = "unstable-2023-05-28";

  src = fetchFromGitLab {
    domain = "invent.kde.org";
    owner = "system";
    repo = "xwaylandvideobridge";
    rev = "970e44c54642e1f50222e4cf8109313cb6ea435d"; #"9853b50f2494f458e8d103aac631c52a5352b4c9";
    hash = "sha256-0000000000000000000000000000000000000000000000000000";#"sha256-enGDIPGdEA9DaqIiVUprdnGuuuQ/B2dq8H7nnid61QE=";
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    pkg-config
  ];

  buildInputs = [
    qt5.qtbase
    qt5.qtquickcontrols2
    qt5.qtx11extras
    libsForQt5.kdelibs4support
    (libsForQt5.kpipewire.overrideAttrs (oldAttrs: {
      version = "unstable-2023-05-23";

      src = fetchFromGitLab {
        domain = "invent.kde.org";
        owner = "plasma";
        repo = "kpipewire";
        rev = "6734f182c2213634e3b639868988f0701f55c715";
        hash = "sha256-0000000000000000000000000000000000000000000000000000";
      };
    }))
  ];

  dontWrapQtApps = true;
}