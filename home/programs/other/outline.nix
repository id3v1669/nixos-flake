{
  lib,
  stdenv,
  fetchurl,
  appimage-run,
  makeWrapper,
  makeDesktopItem,
  runtimeShell
}:
stdenv.mkDerivation rec {
    name = "outline-client-${version}";
    version = "1.10.1";
    src = fetchurl {
    name   = "outline-client";
    url    = "https://github.com/Jigsaw-Code/outline-client/releases/download/v${version}/Outline-Client.AppImage";
    sha256 = "18p2g7fwq7h5dllwrqv54d677c7anqikqx6abmknyggkbginlsj4";
    };

    buildInputs = [ appimage-run ];

    unpackPhase = ":";

    installPhase = ''
      mkdir -p $out/{bin,share}
      cp $src $out/share/outline-client.AppImage
      echo "#!${runtimeShell}" > $out/bin/outline-client
      echo "${appimage-run}/bin/appimage-run $out/share/outline-client.AppImage" >> $out/bin/outline-client
      chmod +x $out/bin/outline-client $out/share/outline-client.AppImage
    '';
  }