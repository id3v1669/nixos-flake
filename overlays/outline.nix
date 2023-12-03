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
}:
appimageTools.wrapType2 rec {

  pname = "Outline-Client";
  version = "1.10.1";

  src = fetchurl {
    url = "https://github.com//Jigsaw-Code/outline-client/releases/download/v${version}/Outline-Client.AppImage";
    sha256 = "1aqgcsq2j7mhhal8y3swr9ikri80j94820r8pziwcbpnc0v3d4pm";
  };

  extraPkgs = pkgs: with pkgs; [polkit_gnome polkit];

  extraInstallCommands = ''
    packed="$out/resources/app.asar"
    rm -rf $out/resources/app.asar.unpacked
    unpacked="$out/resources/app.asar.unpacked"
    ${nodePackages.asar}/bin/asar extract "$packed" "$unpacked"
    sed -i "s|/usr/bin/pkexec|/usr/bin/pkexec', '/run/wrappers/bin/pkexec|" "$unpacked/node_modules/sudo-prompt/index.js"
    sed -i 's|/usr/bin/pkexec|/usr/bin/pkexec","/run/wrappers/bin/pkexec|' "$unpacked/build/electron/electron/index.js"
    sed -i "s|/bin/bash|/usr/bin/env bash|" "$unpacked/build/electron/electron/index.js"
    echo -e '#!/usr/bin/env bash\nreturn 0' > "$unpacked/tools/outline_proxy_controller/dist/install_linux_service.sh"
    cp "$unpacked/tools/outline_proxy_controller/dist/OutlineProxyController" "$out/bin/OutlineProxyController"
    rm -rf "$packed"
  '';
  
  meta = with lib; {
    description = "Outline Client vpn(proxy)";
    homepage = "https://github.com//Jigsaw-Code/outline-client";
    #broken = true; # app starts but doesn't connect https://discourse.nixos.org/t/appimage-and-polkit-outline-vpn-client/33519
    maintainers = with maintainers; [ id3v1669 ];
    platforms = [ "x86_64-linux" ];
  };
}