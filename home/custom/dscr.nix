{ 
lib,
stdenv,
fetchFromGitHub,
fetchFromGitLab,
cmake,
extra-cmake-modules,
python3,
makeWrapper,
qt5,
libsForQt5,
pkg-config,
pipewire,
fetchurl,
makeDesktopItem,
git
}:
stdenv.mkDerivation rec {
  pname = "discord-screenaudio";
  version = "1.8.2";

  srcs = [
    (fetchurl {
      url = "https://github.com/maltejur/${pname}/archive/refs/tags/v${version}.tar.gz";
      sha256 = "b71e2cbc95de864eb93d14167b36aeb34005794b15a5e69adad9db15318eeb4a";
    })
    (fetchurl {
      url = "https://github.com/Soundux/rohrkabel/archive/refs/tags/v1.2.tar.gz";
      sha256 = "e167e50d4c633a2b96dde5faa28cd83dd56828868c669fcf86c7e0ade7db1dcd";
    })
  ];

  sourceRoot = "${pname}-${version}";

  nativeBuildInputs = [ cmake pkg-config qt5.wrapQtAppsHook ];

  buildInputs = [
    qt5.qtbase
    qt5.qtwebengine
    libsForQt5.knotifications
    libsForQt5.kxmlgui
    libsForQt5.kglobalaccel
    pipewire
    git
  ];

  preConfigure = ''
    rm -rf submodules/rohrkabel
    mv -v ${./rohrkabel-1.2} submodules/rohrkabel
    echo "${version}" > version.txt
  '';

  configurePhase = ''
    cmake -B build -DCMAKE_INSTALL_PREFIX=$out
  '';

  buildPhase = ''
    cmake --build build --config Release
  '';

  installPhase = ''
    DESTDIR=$out cmake --install build
  '';

}
# let
#   rohrkabel = fetchFromGitHub {
#     owner = "Soundux";
#     repo = "rohrkabel";
#     rev = "v1.2";
#     sha256 = "sha256-8VEvieSEn021mZAtw1JoNg+Oxe3Zap4jMcP+RDgqWEU="; # you'd have to calculate this
#   };
# in
# stdenv.mkDerivation rec {
#   pname = "discordsrc"; # Name of the package
#   version = "1.8.2";
#   src = fetchFromGitHub {
#     owner = "maltejur";
#     repo = "discord-screenaudio";
#     rev = "v${version}"; #"94b27f5b6acd815f8ca6f7b92ea31b381f2ae7fd";
#     hash = "sha256-usKPhKJvEilWk9PIModLF+AcetE8SvS0UNRIZnKd6tg=";
#   };
#   preConfigure = ''
#     rm -rf submodules/rohrkabel
#     cp -r ${rohrkabel} submodules/rohrkabel
#   '';

#   nativeBuildInputs = [
#     cmake
#     extra-cmake-modules
#     pkg-config
#     git
#     qt5.wrapQtAppsHook
#   ];
  
#   buildInputs = [
#     qt5.qtbase
#     qt5.qtquickcontrols2
#     qt5.qtx11extras
#     qt5.qtwebengine
#     libsForQt5.knotifications
#     libsForQt5.kxmlgui
#     libsForQt5.kglobalaccel
#     git
#     # (libsForQt5.kpipewire.overrideAttrs (oldAttrs: {
#     #   version = "unstable-2023-09-06";

#     #   src = fetchFromGitLab {
#     #     domain = "invent.kde.org";
#     #     owner = "plasma";
#     #     repo = "kpipewire";
#     #     rev = "8d097a4d1c1dbea2d4fe41f4c1aeb4d056ad8b4c";
#     #     sha256 = "1q6m9w8chvld5jyrh88f6c3yiy4wiaqnpqg7wba7f3gzrf4njbsh";
#     #   };
#     # }))
#     # (pipewire.overrideAttrs (oldAttrs: {
#     #   version = "unstable-2023-09-06";

#     #   src = fetchFromGitLab {
#     #     domain = "gitlab.freedesktop.org";
#     #     owner = "pipewire";
#     #     repo = "pipewire";
#     #     rev = "ee1bb2362d96020d7101d89e7909714bcf1e7ce1";
#     #     sha256 = "sha256-pqs991pMqz3IQE+NUk0VNzZS4ExwfoZqBQDWBSGdWcs=";
#     #   };
#     # }))
#   ];

#   configurePhase = ''
#     cmake -B build
#   '';

#   buildPhase = ''
#     cmake --build build --config Release
#   '';

#   installPhase = ''
#     cmake --install build
#   '';
#   desktopItems = [
#     (makeDesktopItem {
#       name = "discord-src";
#       exec = "discord-src --disable-gpu --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland";
#       icon = "webcord";
#       desktopName = "Discord Screen Audio";
#       categories = [ "Network" "InstantMessaging" ];
#     })
#   ];
# }
