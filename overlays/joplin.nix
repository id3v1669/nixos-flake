{ appimageTools
, fetchurl
, makeWrapper
}:
let
  pname = "joplin-desktop";
  version = "2.14.20";

  src = fetchurl {
    url = "https://github.com/laurent22/joplin/releases/download/v${version}/Joplin-${version}.AppImage";
    hash = "sha256-LVN4HHLQqU8/RznFyhsAICr50YUKljIoO9ulsW9ohiA=";
  };

  appimageContents = appimageTools.extractType2 {
    inherit pname version src;
  };

in appimageTools.wrapType2 {
  inherit pname version src;

  profile = ''
    export LC_ALL=C.UTF-8
    '';

  multiArch = false;
  extraPkgs = appimageTools.defaultFhsEnvArgs.multiPkgs;
  extraInstallCommands = ''
    mv $out/bin/{${pname}-${version},${pname}}
    source "${makeWrapper}/nix-support/setup-hook"
    wrapProgram $out/bin/${pname} \
    --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform=wayland --enable-features=WaylandWindowDecorations}}"
    install -Dm444 ${appimageContents}/@joplinapp-desktop.desktop -t $out/share/applications
    install -Dm444 ${appimageContents}/@joplinapp-desktop.png -t $out/share/pixmaps
    substituteInPlace $out/share/applications/@joplinapp-desktop.desktop \
    --replace 'Exec=AppRun' 'Exec=${pname}' \
    --replace 'Icon=joplin' "Icon=@joplinapp-desktop"
  '';
}