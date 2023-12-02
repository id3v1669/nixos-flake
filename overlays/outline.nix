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
}:
let
  pname = "Outline-Client";
  version = "1.10.1";

  src = fetchurl {
    url = "https://github.com//Jigsaw-Code/outline-client/releases/download/v${version}/Outline-Client.AppImage";
    sha256 = "1aqgcsq2j7mhhal8y3swr9ikri80j94820r8pziwcbpnc0v3d4pm";
  };

  appimageContents = appimageTools.extractType2 {
    inherit pname version src;
  };

in appimageTools.wrapType2 {
  inherit pname version src;

  extraPkgs = appimageTools.defaultFhsEnvArgs.multiPkgs;

  profile = ''
    export LC_ALL=C.UTF-8
    '';

  multiArch = false;
  extraInstallCommands = ''
    mv $out/bin/{${pname}-${version},${pname}}
    source "${makeWrapper}/nix-support/setup-hook"
    wrapProgram $out/bin/${pname} \
    --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform=wayland --enable-features=WaylandWindowDecorations}}" \
    --add-flags "--disable-gpu" \
    --add-flags "--no-sandbox" \
    --prefix PATH : ${lib.makeBinPath [ polkit polkit_gnome bash ]} \
    --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [ polkit polkit_gnome bash ]}
    install -Dm444 ${appimageContents}/outline-client.desktop -t $out/share/applications
    install -Dm444 ${appimageContents}/outline-client.png -t $out/share/pixmaps
    substituteInPlace $out/share/applications/outline-client.desktop \
    --replace 'Exec=AppRun' 'Exec=${pname}'
  '';

  meta = with lib; {
    description = "Outline Client vpn(proxy)";
    homepage = "https://github.com//Jigsaw-Code/outline-client";
    broken = true; # app starts but doesn't connect
    maintainers = with maintainers; [ id3v1669 ];
    platforms = [ "x86_64-linux" ];
  };
}