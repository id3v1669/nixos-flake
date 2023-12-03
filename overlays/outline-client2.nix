# trying to install appimage without appimageTools.wrapType2
{ lib
, stdenv
, appimageTools
, fetchurl
, makeWrapper
, undmg
, polkit
, polkit_gnome
, bash
, electron
, libsecret
, nodePackages
, pkgs
, glibc
, appimage-run
}:
let 
  pname = "Outline-Client";
  version = "1.10.1";

  src = fetchurl {
    url = "https://github.com//Jigsaw-Code/outline-client/releases/download/v${version}/Outline-Client.AppImage";
    sha256 = "1aqgcsq2j7mhhal8y3swr9ikri80j94820r8pziwcbpnc0v3d4pm";
  };

  appimageContents = pkgs.appimageTools.extractType2 { inherit pname version src; };

in 
stdenv.mkDerivation rec {
  # pname = "Outline-Client";
  # version = "1.10.1";

  # src = fetchurl {
  #   url = "https://github.com//Jigsaw-Code/outline-client/releases/download/v${version}/Outline-Client.AppImage";
  #   sha256 = "1aqgcsq2j7mhhal8y3swr9ikri80j94820r8pziwcbpnc0v3d4pm";
  # };
  inherit pname version src;

  dontUnpack = true;

  nativeBuildInputs = with pkgs; [
    appimage-run
    makeWrapper
    glibc
    (callPackage ./tun2socks.nix {})
  ];
  runtimeDeps = with pkgs; [
    appimage-run
    electron
    glibc
    (callPackage ./tun2socks.nix {})
  ];

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share/outline-client/app.asar.unpacked
   
    ${nodePackages.asar}/bin/asar extract ${appimageContents}/resources/app.asar $out/share/outline-client/app.asar.unpacked
    
    sed -i "s|/usr/bin/pkexec|/usr/bin/pkexec', '/run/wrappers/bin/pkexec|" $out/share/outline-client/app.asar.unpacked/node_modules/sudo-prompt/index.js
    sed -i 's|/usr/bin/pkexec|/usr/bin/pkexec","/run/wrappers/bin/pkexec|' $out/share/outline-client/app.asar.unpacked/build/electron/electron/index.js
    sed -i "s|/bin/bash|/usr/bin/env bash|" $out/share/outline-client/app.asar.unpacked/node_modules/sudo-prompt/index.js
    sed -i "s|/bin/bash|/usr/bin/env bash|" $out/share/outline-client/app.asar.unpacked/build/electron/electron/index.js
    echo -e '#!/usr/bin/env bash\nreturn 0' > $out/share/outline-client/app.asar.unpacked/tools/outline_proxy_controller/dist/install_linux_service.sh
    cp $out/share/outline-client/app.asar.unpacked/tools/outline_proxy_controller/dist/OutlineProxyController $out/bin/OutlineProxyController
    chmod +x $out/bin/OutlineProxyController
    ${nodePackages.asar}/bin/asar pack $out/share/outline-client/app.asar.unpacked $out/share/outline-client/app.asar
    makeWrapper "${electron}/bin/electron" "$out/share/outline-client/app.asar" \
      --prefix PATH : ${lib.makeBinPath runtimeDeps} \
      --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath runtimeDeps}
  '';
  
  meta = with lib; {
    description = "Outline Client vpn(proxy)";
    homepage = "https://github.com//Jigsaw-Code/outline-client";
    #broken = true; 
    maintainers = with maintainers; [ id3v1669 ];
    platforms = [ "x86_64-linux" ];
  };
}
# outline_proxy_controller = {
#   description = "Outline Proxy Routing Controller";
#   wantedBy = [ "multi-user.target" ];
#   wants = [ "network.target" ];
#   after = [ "network.target" ];
#   serviceConfig = {
#     Type = "simple";
#     ExecStart = "${pkgs.outline-client}/bin/OutlineProxyController --socket-filename=/var/run/outline_controller --owning-user-id=1000";
#   };
# };
