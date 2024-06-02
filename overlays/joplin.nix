{ appimageTools
, fetchurl
, makeWrapper
}:
let
  pname = "joplin-desktop";
  version = "3.0.8";

  src = fetchurl {
    url = "https://github.com/laurent22/joplin/releases/download/v${version}/Joplin-${version}.AppImage";
    hash = "sha256-SKJP3d+7CWf6szw8ugH+Nx1r0QI6YzfwJzThNniBkvM=";
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
    source "${makeWrapper}/nix-support/setup-hook"
    install -Dm444 ${appimageContents}/@joplinapp-desktop.desktop -t $out/share/applications
    install -Dm444 ${appimageContents}/@joplinapp-desktop.png -t $out/share/pixmaps
    substituteInPlace $out/share/applications/@joplinapp-desktop.desktop \
    --replace 'Exec=AppRun' 'Exec=${pname}' \
    --replace 'Icon=joplin' "Icon=@joplinapp-desktop"
  '';
}
