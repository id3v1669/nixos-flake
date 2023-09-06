{ stdenv
, fetchFromGitLab
, cmake
, pkg-config
, extra-cmake-modules
, qt5
, qt6
, libsForQt5
}: 
# let
#   myExtraCMakeModules = extra-cmake-modules.overrideAttrs (oldAttrs: {
#     version = "unstable-2023-09-05";
#     src = fetchFromGitLab {
#       domain = "invent.kde.org";
#       owner = "frameworks";
#       repo = "extra-cmake-modules";
#       rev = "9620f3e9390b2ed4c1eb2a7c37d494de3da6af67";
#       sha256 = "17l8wdbgwpgr7j019qhhs1nk7rvv1r72n1v4g5xlhnjy65kr24ad";
#     };
#   });
# in
stdenv.mkDerivation {
  pname = "xwaylandvideobridge";
  version = "unstable-2023-09-05";

  src = fetchFromGitLab {
    domain = "invent.kde.org";
    owner = "system";
    repo = "xwaylandvideobridge";
    rev = "970e44c54642e1f50222e4cf8109313cb6ea435d";
    sha256 = "0sd87mwjn0n2mscfa0p6jyqq9csgxyypqgc1xvqd51n6flig1j5s";
  };

   patches = [ ./xwbr.patch ];

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
        rev = "8d097a4d1c1dbea2d4fe41f4c1aeb4d056ad8b4c";#"600505677474a513be4ea8cdc8586f666be7626d";
        sha256 = "1q6m9w8chvld5jyrh88f6c3yiy4wiaqnpqg7wba7f3gzrf4njbsh";
        #hash = "sha256-ME/9xOyRvvPDiYB1SkJLMk4vtarlIgYdlereBrYTcL4=";
      };
    }))
  ];

  #dontWrapQtApps = true;
}
