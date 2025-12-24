final: pkgs: {
  wxedid = pkgs.stdenv.mkDerivation rec {
    pname = "wxedid";
    version = "0.0.32";

    src = pkgs.fetchurl {
      url = "https://downloads.sourceforge.net/${pname}/${pname}-${version}.tar.gz";
      hash = "sha256-XYbRNuQ+ha05gJgs7P+HzxdRksFRJHxLiWDfnF5GHMI=";
    };

    patchPhase = ''
      runHook prePatch

      patchShebangs ./src/rcode/rcd_autogen

      runHook postPatch
    '';

    nativeBuildInputs = [pkgs.autoreconfHook pkgs.wrapGAppsHook3];
    buildInputs = [pkgs.wxGTK32];
  };
  librepods = pkgs.stdenv.mkDerivation rec {
    pname = "librepods";
    version = "0.1.0-fa30d3c";

    src = pkgs.fetchFromGitHub {
      owner = "kavishdevar";
      repo = "librepods";
      rev = "fa30d3c09aa8be1737988b8b0259e1710bd3a125";
      hash = "sha256-wKXST93GXGhlFSB7vbxbDduiF37f5wIcUxsz7M2tGJk=";
    };

    nativeBuildInputs = with pkgs; [
      cmake
      pkg-config
      qt6.wrapQtAppsHook
    ];

    buildInputs = with pkgs; [
      qt6.qtbase
      qt6.qtdeclarative
      qt6.qtconnectivity
      qt6.qtmultimedia
      libpulseaudio
    ];

    configurePhase = ''
      cmake ./linux
    '';

    buildPhase = ''
      make
    '';

    installPhase = ''
      mkdir -p $out/bin
      mv librepods $out/bin/${pname}
    '';
    meta = {
      description = "AirPods libreated from Apple's ecosystem.";
      homepage = "https://github.com/kavishdevar/librepods";
      mainProgram = "librepods";
      license = pkgs.lib.licenses.agpl3Only;
      platforms = pkgs.lib.platforms.linux;
    };
  };
}
