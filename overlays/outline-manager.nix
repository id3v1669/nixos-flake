{ lib
, stdenv
, appimageTools
, fetchurl
, makeWrapper
, undmg
}:
let
  pname = "Outline-Manager";
  version = "1.14.0";

  inherit (stdenv.hostPlatform) system;
  throwSystem = throw "Unsupported system: ${system}";

  suffix = {
    x86_64-linux = "AppImage";
    x86_64-darwin = "dmg";
    aarch64-darwin = "dmg";
  }.${system} or throwSystem;

  src = fetchurl {
    url = "https://github.com/Jigsaw-Code/outline-server/releases/download/manager-v${version}/Outline-Manager.${suffix}";
    hash = {
      x86_64-linux = "sha256-Zd+jvTz55jZoFlshAr5j7PUOMQjcSuMfkLc/S4BCKZs=";
      x86_64-darwin = "sha256-FI6DWcc1HAcuY/YT0hiZSFVot9zDl/16gNn8ENVwuu4=";
      aarch64-darwin = "sha256-FI6DWcc1HAcuY/YT0hiZSFVot9zDl/16gNn8ENVwuu4=";
    }.${system} or throwSystem;
  };

  meta = with lib; {
    description = "Outline Manager - app to manage outline vpn(shadowsocks) server";
    homepage = "https://github.com/Jigsaw-Code/outline-server";
    license = licenses.asl20;
    maintainers = with maintainers; [ id3v1669 ];
    platforms = [ 
      "x86_64-linux"
      "x86_64-darwin"
      "aarch64-darwin" 
    ];
  };

in
if stdenv.isDarwin
then stdenv.mkDerivation {
  inherit pname version src meta;

  nativeBuildInputs = [ undmg ];

  sourceRoot = "Outline\ Manager.app";

  installPhase = ''
    runHook preInstall
    mkdir -p $out/Applications/Outline\ Manager.app
    cp -R . $out/Applications/Outline\ Manager.app
    runHook postInstall
  '';
}
else 
let
  appimageContents = appimageTools.extractType2 {
    inherit pname version src;
  };
in
appimageTools.wrapType2 rec {
  inherit pname version src meta;
  
  extraPkgs = appimageTools.defaultFhsEnvArgs.multiPkgs;

  extraInstallCommands = ''
    mv $out/bin/{${pname}-${version},${pname}}
    source "${makeWrapper}/nix-support/setup-hook"
    wrapProgram $out/bin/${pname} \
    --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform=wayland --enable-features=WaylandWindowDecorations}}"
    install -Dm444 ${appimageContents}/outline-manager.desktop -t $out/share/applications
    install -Dm444 ${appimageContents}/outline-manager.png -t $out/share/pixmaps
    substituteInPlace $out/share/applications/outline-manager.desktop \
    --replace 'Exec=AppRun' 'Exec=${pname}'
  '';
}
