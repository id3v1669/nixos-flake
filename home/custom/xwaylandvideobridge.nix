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
    rev = "850ea0d965426e85746d5e2d4dd6f4c146403b7b";
    hash = "sha256-5gRSkSdp9CGiVWjvIPKXPyEnI6hm1h2IeMunZymNa/M=";
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    pkg-config
    qt5.wrapQtAppsHook
  ];

  patches = [
    (fetchpatch {
      url =
        "https://aur.archlinux.org/cgit/aur.git/plain/cursor-mode.patch?h=xwaylandvideobridge-cursor-mode-2-git";
      hash = "sha256-649kCs3Fsz8VCgGpZ952Zgl8txAcTgakLoMusaJQYa4=";
    })
  ];

  buildInputs = [
    qt5.qtbase
    qt5.qtquickcontrols2
    qt5.qtx11extras
    libsForQt5.kdelibs4support
    (libsForQt5.kpipewire.overrideAttrs (oldAttrs: {
      version = "unstable-2023-10-11";

      src = fetchFromGitLab {
        domain = "invent.kde.org";
        owner = "plasma";
        repo = "kpipewire";
        rev = "e08b7be1f2a7bdaed2291cd5dc6374d6535db1b8"; #"8d097a4d1c1dbea2d4fe41f4c1aeb4d056ad8b4c";
        hash = "sha256-nipZKj0NqthpexXgQCtJvA3mwWfIn58zsN6usJfm6pQ=";
      };
    }))
  ];
}
