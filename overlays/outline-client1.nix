{ lib
, stdenv
, appimageTools
, fetchurl
, makeWrapper
, undmg
, polkit
, polkit_gnome
, bash
, electron_26
, libsecret
, nodePackages
}:let
pname = "Outline-Client";
  version = "1.10.1";

  src = fetchurl {
    url = "https://github.com//Jigsaw-Code/outline-client/releases/download/v${version}/Outline-Client.AppImage";
    sha256 = "1aqgcsq2j7mhhal8y3swr9ikri80j94820r8pziwcbpnc0v3d4pm";
  };
  
  appimageContents = appimageTools.extractType2 {
    inherit pname version src;
  };
in
appimageTools.wrapType2 rec {
  inherit pname version src;
  
  extraPkgs = pkgs: with pkgs; [polkit_gnome polkit];

  extraInstallCommands = ''
    mv $out/bin/{${pname}-${version},${pname}}
    source "${makeWrapper}/nix-support/setup-hook"
    wrapProgram $out/bin/${pname} \
    --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform=wayland --enable-features=WaylandWindowDecorations}}" \
    --add-flags "--disable-gpu" \
    --add-flags "--no-sandbox"
    install -Dm444 ${appimageContents}/outline-client.desktop -t $out/share/applications
    install -Dm444 ${appimageContents}/outline-client.png -t $out/share/pixmaps
    substituteInPlace $out/share/applications/outline-client.desktop \
    --replace 'Exec=AppRun' 'Exec=${pname}'
  '';
  
  meta = with lib; {
    description = "Outline Client vpn(proxy)";
    homepage = "https://github.com//Jigsaw-Code/outline-client";
    broken = true; # app starts but doesn't connect https://discourse.nixos.org/t/appimage-and-polkit-outline-vpn-client/33519
    maintainers = with maintainers; [ id3v1669 ];
    platforms = [ "x86_64-linux" ];
  };
}