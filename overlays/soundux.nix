{ lib
, stdenv
, fetchFromGitHub
, cmake
, ninja
, pkg-config
, makeWrapper
, wrapGAppsHook
, makeDesktopItem
, copyDesktopItems
, libappindicator-gtk3
, openssl
, pipewire
, pulseaudio
, webkitgtk
, xorg
, libpulseaudio
, libwnck3
, ffmpeg
, youtube-dl
, gcc12
}:
stdenv.mkDerivation rec {
  pname = "soundux";
  version = "0.2.7";

  src = fetchFromGitHub {
    owner = "Soundux";
    repo = "Soundux";
    rev = "0.2.7";
    fetchSubmodules = true;
    hash = "sha256-aSCsg6nJt6F+6O7UeXnvYva0vllTfsxK/cjaeOhObZY=";
  };

  cmakeFlags = [ "-DCMAKE_BUILD_TYPE=Release" ];
  NIX_CFLAGS_COMPILE = [ "-Wno-error=deprecated-declarations" ];

  dontWrapGApps = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/opt $out/bin
    cp -r dist soundux-${version} $out/opt

    runHook postInstall
  '';

  postFixup = ''
    makeWrapper $out/opt/soundux-${version} $out/bin/soundux \
      --prefix LD_LIBRARY_PATH ":" ${lib.makeLibraryPath [libpulseaudio pipewire libwnck3 ]} \
      "''${gappsWrapperArgs[@]}" \
      "--prefix PATH ":" ${lib.makeBinPath [ffmpeg youtube-dl ]}
  '';

  nativeBuildInputs = [
    cmake
    ninja
    pkg-config
    makeWrapper
    wrapGAppsHook
    copyDesktopItems
    gcc12
  ];

  buildInputs = [
    libappindicator-gtk3
    openssl
    pipewire
    pulseaudio
    webkitgtk
    xorg.libX11
    xorg.libXtst
  ];

  desktopItems = makeDesktopItem {
    name = "Soundux";
    exec = pname;
    desktopName = "Soundux";
    genericName = "Soundboard";
    categories = [ "Audio" "Music" "Player" "AudioVideo" ];
    comment = "Crossplatform soundboard";
  };

}