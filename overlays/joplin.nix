final: pkgs: {
  joplin-desktop = pkgs.appimageTools.wrapType2 rec {
    pname = "joplin-desktop";
    version = "3.3.12";
    src = pkgs.fetchurl {
      url = "https://github.com/laurent22/joplin/releases/download/v${version}/Joplin-${version}.AppImage";
      sha256 = "1fjrblmlpm6sf4jdvifmyxic0rw2bs1f4sbw3nz4xy7wlsab5f62";
    };

    nativeBuildInputs = [pkgs.makeWrapper];

    profile = ''
      export LC_ALL=C.UTF-8
    '';

    extraInstallCommands = let
      appimageContents = pkgs.appimageTools.extractType2 {
        inherit pname version src;
      };
    in ''
      wrapProgram $out/bin/joplin-desktop \
        --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform=wayland --enable-features=WaylandWindowDecorations}}"
      install -Dm644 ${appimageContents}/joplin.desktop $out/share/applications/joplin.desktop
      install -Dm644 ${appimageContents}/joplin.png $out/share/pixmaps/joplin.png
      substituteInPlace $out/share/applications/joplin.desktop \
        --replace-fail 'Exec=AppRun' 'Exec=joplin-desktop'
    '';
  };
}
