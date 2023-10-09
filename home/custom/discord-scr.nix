{ stdenv
, lib
, fetchFromGitHub
, cmake
, extra-cmake-modules
, libsForQt5
, pkgs
, pkg-config
, makeDesktopItem
, ...
}:

stdenv.mkDerivation rec {
  pname = "discord-screenaudio";
  version = "1.8.2";

  src = fetchFromGitHub {
    owner = "maltejur";
    repo = "discord-screenaudio";
    rev = "v${version}";
    sha256 = "sha256-aJ0GTekqaO8UvbG3gzYz5stA9r8pqjTHdR1ZkBHPMeo=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    pkg-config
    libsForQt5.qt5.wrapQtAppsHook
  ];
  buildInputs = [
    libsForQt5.qt5.wrapQtAppsHook
    libsForQt5.qt5.qtbase
    libsForQt5.qt5.qtwebengine
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtwayland
    libsForQt5.kwidgetsaddons
    libsForQt5.ktextwidgets
    libsForQt5.kjobwidgets
    libsForQt5.kconfigwidgets
    libsForQt5.knotifications
    libsForQt5.kxmlgui
    pkgs.pipewire
  ];

  prePatch = ''
sed -i -e "59i target_include_directories($\{PROJECT_NAME} SYSTEM PRIVATE ${pkgs.pipewire.dev}/include/pipewire-0.3 ${pkgs.pipewire.dev}/include/spa-0.2)" submodules/rohrkabel/CMakeLists.txt
  '';

  qtWrapperArgs = [ "--set QT_QPA_PLATFORM wayland" ];

  desktopItems = [
    (makeDesktopItem {
      name = "discord-screenaudio";
      exec = "discord-screenaudio";
      icon = "discord-screenaudio";
      desktopName = "discord-screenaudio";
      comment = "comment";
      categories = [ "Network" "InstantMessaging" ];
    })
  ];
}

