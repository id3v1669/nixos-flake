{ lib
, stdenv
, fetchFromGitHub
, cmake
, pkg-config
, makeBinaryWrapper
, pipewire
, libpulseaudio
, libappindicator
, libstartup_notification
, openssl
, libwnck
, pcre
, util-linux
, libselinux
, libsepol
, libthai
, libdatrie
, xorg
, libxkbcommon
, libepoxy
, dbus
, at-spi2-core
, nlohmann_json
, httplib
, webkitgtk
, ffmpeg
, lsb-release

, pkgs
, ninja
, pcre2
, libdwarf
, libbfd
, libpsl
, sqlite
, libsysprof-capture
, libremidi
, wrapGAppsHook
}:
let 
  fancypp = (pkgs.callPackage ./fancypp.nix {});
  semver-cpp = (pkgs.callPackage ./semver-cpp.nix {});
  guardpp = (pkgs.callPackage ./guardpp.nix {});
  yt-dlp = pkgs.yt-dlp.override { withAlias = true; };
in
stdenv.mkDerivation rec {
  pname = "soundux";
  version = "0.2.8";

  src = fetchFromGitHub {
    owner = "Soundux";
    repo = "Soundux";
    rev = "fca05c9251f7d69dd9b201cb4bbb5f262f9ed07f";
    hash = "sha256-uqvnIGc6jbmlPBb3tbUU4XEgHejuruouxe8eUTz51+0=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    cmake
    pkg-config
    wrapGAppsHook
    makeBinaryWrapper
  ];

  buildInputs = [
    pipewire
    libpulseaudio
    libappindicator
    openssl
    libwnck
    pcre
    util-linux
    libselinux
    libsepol
    libthai
    libdatrie
    xorg.libXdmcp
    xorg.libXtst
    xorg.libXres
    libxkbcommon
    libepoxy
    dbus
    at-spi2-core
    nlohmann_json
    fancypp
    httplib
    semver-cpp
    libstartup_notification
    webkitgtk
    yt-dlp
    ffmpeg

    ninja
    pcre2
    libdwarf
    libbfd
    libpsl
    sqlite
    libsysprof-capture
    libremidi
    guardpp
  ];

  postPatch = ''
    # cannot be overwritten with variables
    substituteInPlace CMakeLists.txt \
      --replace "set(CMAKE_INSTALL_PREFIX \"/opt/soundux\" CACHE PATH \"Install path prefix, prepended onto install directories.\" FORCE)" "" \
      --replace "/usr/share" "$out/usr/share"
    substituteInPlace src/ui/impl/webview/webview.cpp \
      --replace "/usr/share/pixmaps/soundux.png" "$out/share/pixmaps/soundux.png"
  '';

  dontAddPrefix = true;

  preConfigure = ''
    # This needs to be set in preConfigure to access the $prefix variable
    export cmakeFlags="-DCMAKE_INSTALL_PREFIX=$prefix/opt $cmakeFlags"

    # Replace some problematic submodules with local symlinks
    rm -rf \
      lib/json \
      lib/fancypp \
      lib/lib-httplib \
      lib/semver \
      lib/guardpp

    ln -s ${nlohmann_json} lib/json
    ln -s ${fancypp} lib/fancypp
    ln -s ${httplib} lib/lib-httplib
    ln -s ${semver-cpp} lib/semver
    ln -s ${guardpp} lib/guardpp
  '';

  postInstall = ''
    mv "$out/var/empty/share" "$out"
    rm -rf "$out/var"
    mkdir "$out/bin"
    ln -s "$out/opt/soundux" "$out/bin"
    substituteInPlace "$out/share/applications/soundux.desktop" \
      --replace "/opt/soundux/soundux" "soundux"
  '';

  postFixup = let
    rpaths = lib.makeLibraryPath [libwnck pipewire libpulseaudio];
  in ''
    # Wnck, PipeWire, and PulseAudio are dlopen-ed by Soundux, so they do
    # not end up on the RPATH during the build process.
    patchelf --add-rpath "${rpaths}" "$out/opt/soundux-${version}"

    # Work around upstream bug https://github.com/Soundux/Soundux/issues/435
    wrapProgram "$out/bin/soundux" \
      --prefix PATH : ${lib.makeBinPath [ yt-dlp ffmpeg lsb-release ]} \
  '';
}
#prefix if without wrapGAppsHook 
#--prefix XDG_DATA_DIRS : "${gtk3}/share/gsettings-schemas/${gtk3.name}" \