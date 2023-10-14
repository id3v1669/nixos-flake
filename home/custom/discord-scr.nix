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
    qt6.wrapQtAppsHook
  ];
  buildInputs = [
    qt6.qtbase
    qt6.qtwebengine
    qt6.qtwayland
    pipewire
  ];

  qtWrapperArgs = [ 
    "--set QT_QPA_PLATFORM wayland"
  ];
  desktopItems = [
    (makeDesktopItem {
      name = "discord-screenaudio";
      exec = "arrpc && discord-screenaudio";
      icon = "discord-screenaudio";
      desktopName = "discord-screenaudio";
      comment = "comment";
      categories = [ "Network" "InstantMessaging" ];
    })
  ];
}

# { stdenv
# , lib
# , fetchFromGitHub
# , cmake
# , extra-cmake-modules
# , qt5
# , pkgs
# , pkg-config
# , makeDesktopItem
# , pipewire
# , pipewire_0_2
# , ...
# }:

# stdenv.mkDerivation rec {
#   pname = "discord-screenaudio";
#   version = "1.9.0";

#   src = fetchFromGitHub {
#     owner = "maltejur";
#     repo = "discord-screenaudio";
#     rev = "372c683ae955ee61970eb89adec3ac7db3b0a803";
#     hash = "sha256-WBpWxwy462bmUNRv6oCEBp+pDpKFsl+9Wk09fDnd4ss=";
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
#     qt5.qtwebengine
#     #qt5.qtquickcontrols2
#     #libsForQt5.kwidgetsaddons
#     #libsForQt5.ktextwidgets
#     #libsForQt5.kjobwidgets
#     #libsForQt5.kconfigwidgets
#     #libsForQt5.knotifications
#     #libsForQt5.kxmlgui
#     pipewire
#     pipewire.lib
#     pipewire.dev
#     #pipewire_0_2
#     #pipewire_0_2.lib
#     #pipewire_0_2.dev
#   ];
#   NIX_CFLAGS_COMPILE = [
#     "-I${pipewire.dev}/include/pipewire-0.3"
#     "-I${pipewire.dev}/include/spa-0.2"
#     "-Wno-pedantic"
#   ];
# #  postInstall = ''
# #patchelf --set-rpath ${pipewire_0_2}/lib:${libsForQt5.qt5.qtwebengine}/lib $out/bin/discord-screenaudio
# #  '';

#   #qtWrapperArgs = [ "--set QT_QPA_PLATFORM wayland" ];
  
#   #qt wrap args with paths to dependencies
#   qtWrapperArgs = [
#     "--set QT_QPA_PLATFORM wayland"
#     #"--set QT_PLUGIN_PATH ${qt5.qtbase}/plugins"
#     #"--set QML2_IMPORT_PATH ${qt5.qtbase}/qml"
#     #now path for libs like qtwebengine and pipewire
#     #"--set LD_LIBRARY_PATH ${libsForQt5.qt5.qtbase}/lib:${libsForQt5.qt5.qtwebengine}/lib:${pipewire_0_2}/lib:${pipewire_0_2.lib}/lib:${pipewire_0_2.dev}/lib:${pipewire}/lib:${pipewire.lib}/lib:${pipewire.dev}/lib"
#     #"--set LD_LIBRARY_PATH ${lib.makeLibraryPath buildInputs}"
#   ];


#   desktopItems = [
#     (makeDesktopItem {
#       name = "discord-screenaudio";
#       exec = "discord-screenaudio";
#       icon = "discord-screenaudio";
#       desktopName = "discord-screenaudio";
#       comment = "comment";
#       categories = [ "Network" "InstantMessaging" ];
#     })
#   ];
# }


