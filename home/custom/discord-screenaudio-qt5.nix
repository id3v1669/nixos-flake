{ stdenv
, lib
, fetchFromGitHub
, cmake
, extra-cmake-modules
, qt5
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
    qt5.wrapQtAppsHook
  ];
  buildInputs = [
    qt5.qtbase
    qt5.qtwebengine 
    pipewire
    pipewire.lib
    pipewire.dev
  ];
  NIX_CFLAGS_COMPILE = [
    "-I${pipewire.dev}/include/pipewire-0.3"
    "-I${pipewire.dev}/include/spa-0.2"
    "-Wno-pedantic"
  ];
  qtWrapperArgs = [
    "--set QT_QPA_PLATFORM wayland"
    #"--set LD_LIBRARY_PATH ${lib.makeLibraryPath buildInputs}"
  ];


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