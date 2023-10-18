{ stdenv
, lib
, fetchFromGitHub
, cmake
, qt6
, pkgs
, pkg-config
, makeDesktopItem
, pipewire
, nix-update-script
, ...
}:

stdenv.mkDerivation rec {
  pname = "discord-screenaudio";
  version = "1.9.1";

  src = fetchFromGitHub {
    owner = "maltejur";
    repo = "discord-screenaudio";
    rev = "6ea5455c7e5a6127dd62034eadc13ca5effdf49e";
    hash = "sha256-Pm6p4jssDyDp+REXrYGK6S15pdgC7DliWD1EG83frLM=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    cmake
    pkg-config
    qt6.wrapQtAppsHook
  ];

  buildInputs = [
    qt6.qtbase
    qt6.qtwebengine
    qt6.qtwayland
    pipewire
  ];

  #patches = [
  #  ./changes.patch
  #];

  passthru.updateScript = nix-update-script { };

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


