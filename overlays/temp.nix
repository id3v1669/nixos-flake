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
    version = "0.1.0-96ee241";

    src = pkgs.fetchFromGitHub {
      owner = "kavishdevar";
      repo = "librepods";
      rev = "784b7a2cfa5e061b5a1bac9a02803503b0ff92ac";
      hash = "sha256-izCiSaYD1KCLe18jrFjMOF0QOo0kxsXMcJBjcBhHD9M=";
    };

    nativeBuildInputs = with pkgs; [
      cmake
      qt6.wrapQtAppsHook
    ];

    buildInputs = with pkgs; [
      qt6.qtbase
      qt6.qtdeclarative
      qt6.qtconnectivity
      qt6.qtmultimedia
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
