{ 
lib,
stdenv,
fetchFromGitHub,
cmake,
python3,
makeWrapper,
qt5,
libsForQt5,
pkg-config,
pipewire,
git
}:

stdenv.mkDerivation rec {
  pname = "discordsrc"; # Name of the package
  version = "1.8.2"; # Date as version, or use a release tag

  src = fetchFromGitHub {
    owner = "maltejur";
    repo = "discord-screenaudio";
    rev = "v${version}";
    hash = "sha256-usKPhKJvEilWk9PIModLF+AcetE8SvS0UNRIZnKd6tg=";
  };

  nativeBuildInputs = [ 
    cmake
    pkg-config
  ];
  
  buildInputs = [
    gt5.qtbase
    qt5.qtwebengine
    libsForQt5.knotifications
    libsForQt5.kxmlgui
    libsForQt5.kglobalaccel
    pipewire
    git
  ];

  # Here, you specify the build commands:
  configurePhase = ''
    cmake -B build
  '';

  buildPhase = ''
    cmake --build build --config Release
  '';

  installPhase = ''
    cmake --install build
  '';
  desktopItems = [
    (makeDesktopItem {
      name = "discord-src";
      exec = "discord-src --disable-gpu --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland";
      icon = "webcord";
      desktopName = "Discord Screen Audio";
      categories = [ "Network" "InstantMessaging" ];
    })
  ];
}
