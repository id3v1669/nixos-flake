{ lib
, stdenv
, fetchFromGitHub
, fetchurl
, nodejs
, nodePackages
, electron
, makeDesktopItem
, callPackage
, runCommand
, pkgs
, python3
, bash
, util-linux
, darwinHelper
}: stdenv.mkDerivation rec
{
  pname = "outline-client";
  version = "1.7.9";

  src = fetchFromGitHub ({
    owner = "Jigsaw-Code";
    repo = "outline-client";
    rev = "client_linux/v1.12.1";
    #fetchSubmodules = true;
    hash = "sha256-eIpRDE0sDqwMlOWCmqhmvfBbHiE2VCiZgRPsRWclITI=";
  });

  patchedSrc = runCommand "patchSrc" { } ''
    cp -r ${src} $out
    chmod +w $out
  '';

  dontConfigure = true;
  dontStrip = true;
  dontPatchELF = true;

  nativeBuildInputs = [ nodejs python3 ];

    buildPhase = ''
      runHook preBuild
      mkdir -p /build/.node-gyp/12.2.3
      tar -xf ${nodeHeaders} -C /build/.node-gyp/12.2.3
      mv /build/.node-gyp/12.2.3/*/include /build/.node-gyp/12.2.3
      echo 9 > /build/.node-gyp/12.2.3/installVersion
      sed -i -e "s|#!/usr/bin/env node|#! ${nodejs}/bin/node|" node_modules/webpack/bin/webpack.js
      echo rebuild nya~
      export ELECTRON_SKIP_BINARY_DOWNLOAD=1
      export ELECTRON_OVERRIDE_DIST_PATH="${electron}/bin"
      DEBUG=electron-rebuild npm run postinstall --verbose --openssl_fips="" -- -f
      npm run webpack
      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall
      mkdir $out
      install package.json "$out"
      cp -a {lib,generated} "$out"
      install -D assets/icon.png "$out/assets/icon.png"
      install -D lib/gui/app/index.html "$out/lib/gui/app/index.html"
      substituteInPlace $out/generated/gui.js \
        --replace '/usr/bin/pkexec' '/usr/bin/pkexec", "/run/wrappers/bin/pkexec' \
        --replace '/bin/bash' '${bash}/bin/bash' \
        --replace '"lsblk"' '"${util-linux}/bin/lsblk"'
      runHook postInstall
    '';

  app = stdenv.mkDerivation rec {
    
    inherit version;

    src = "${nodeModules.development.package}/lib/node_modules/balena-etcher";

    

    
  };
  makeDesktopItem
  {
    name = "balena-etcher";
    exec = "${electron}/bin/electron ${app}";
    comment = "Flash OS images to SD cards and USB drives, safely and easily.";
    desktopName = "BalenaEtcher";
    categories = [ "Utility" ];
    icon = "${app}/assets/icon.png";
  }
}


# {
#   lib,
#   stdenv,
#   fetchurl,
#   appimage-run,
#   makeWrapper,
#   makeDesktopItem,
#   runtimeShell,
#   electron,
#   appimageTools,
#   polkit_gnome,
#   bash
# }:
# stdenv.mkDerivation rec {
#   pname = "outline-client";
#   version = "1.10.1";
#   src = fetchurl {
#     name = "outline-client";
#     url = "https://github.com/Jigsaw-Code/outline-client/releases/download/v${version}/Outline-Client.AppImage";
#     hash = "sha256-9ZI2NmD2LsbjvygDgUiSAMU8Y8pcD4+ogrAeKbBmD6s=";
#   };

#   appimageContents = appimageTools.extract {
#     inherit pname src version;
#   };

#   dontUnpack = true;
#   dontConfigure = true;
#   dontBuild = true;

#   libPath = lib.makeLibraryPath [
#     polkit_gnome
#     bash
#   ];

#   nativeBuildInputs = [ makeWrapper ];

#   installPhase = ''
#     runHook preInstall

#     mkdir -p $out/bin $out/share/${pname} $out/share/applications
#     cp -a ${appimageContents}/{locales,resources} $out/share/${pname}
#     cp -a ${appimageContents}/outline-client.desktop $out/share/applications/${pname}.desktop

#     runHook postInstall
#   '';

#   postFixup = ''
#     # set the env "LOCAL_GIT_DIRECTORY" for dugite so that we can use the git in nixpkgs
#     makeWrapper ${electron}/bin/electron $out/bin/${pname} \
#       --add-flags $out/share/${pname}/resources/app \
#       --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations}}" \
#       --prefix LD_LIBRARY_PATH : ${libPath}
#   '';
#   }