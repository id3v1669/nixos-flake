# { stdenv,
#   fetchFromGitHub,
#   cmake,
#   pkg-config,
#   extra-cmake-modules,
#   qt5,
#   qt6,
#   libsForQt5,
#   pkgs
# }: stdenv.mkDerivation rec
# {
#   pname = "discord-scr";
#   version = "1.8.1";

#   src = fetchFromGitHub {
#     owner = "maltejur";
#     repo = "discord-screenaudio";
#     rev = "v${version}";
#     hash = "sha256-aJ0GTekqaO8UvbG3gzYz5stA9r8pqjTHdR1ZkBHPMeo=";
#     fetchSubmodules = true;
#   };

#   nativeBuildInputs = [
#     cmake
#     extra-cmake-modules
#     pkg-config
#     qt5.wrapQtAppsHook
#   ];

#   buildInputs = [
#     qt5.qtbase
#     qt5.qtquickcontrols2
#     qt5.qtwebengine
#     libsForQt5.kwidgetsaddons
#     libsForQt5.ktextwidgets
#     libsForQt5.kjobwidgets
#     libsForQt5.kconfigwidgets
#     libsForQt5.knotifications
#     libsForQt5.kxmlgui
#     pkgs.pipewire
#     pkgs.git
#   ];
# }