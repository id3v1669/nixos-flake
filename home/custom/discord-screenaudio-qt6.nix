{ stdenv
, lib
, fetchFromGitHub
, cmake
, extra-cmake-modules
, qt6
, pkgs
, pkg-config
, makeDesktopItem
, pipewire
, ...
}:

stdenv.mkDerivation rec {
  pname = "discord-screenaudio";
  version = "1.9.0";

  src = fetchFromGitHub {
    owner = "maltejur";
    repo = "discord-screenaudio";
    rev = "372c683ae955ee61970eb89adec3ac7db3b0a803";
    hash = "sha256-WBpWxwy462bmUNRv6oCEBp+pDpKFsl+9Wk09fDnd4ss=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    pkg-config
    qt6.wrapQtAppsHook
  ];

  buildInputs = [
    qt6.qtbase
    qt6.qtwebengine
    qt6.qt5compat
    qt6.qtwayland
    pipewire
  ];

  patches = [
    ./changes.patch
  ];

  preConfigure = ''
    echo "${version}" > version.txt
  '';

  qtWrapperArgs = [ 
    "--set QT_QPA_PLATFORM wayland"
  ];

  desktopItems = [
    (makeDesktopItem {
      name = "discord-screenaudio";
      exec = "sh -c \"arrpc && discord-screenaudio\"";
      icon = "discord-screenaudio";
      desktopName = "discord-screenaudio";
      comment = "comment";
      categories = [ "Network" "InstantMessaging" ];
    })
  ];
}


