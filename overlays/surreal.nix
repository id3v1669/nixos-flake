final: pkgs: {
  surrealdbx = pkgs.stdenv.mkDerivation rec {
    pname = "surrealdb";
    version = "3.1.5";

    dontUnpack = true;

    src = pkgs.fetchurl {
      url = "https://github.com/surrealdb/surrealdb/releases/download/v${version}/surreal-v${version}.linux-amd64.tgz";
      hash = "sha256-99UVIDugAQveP8alcGznMn01asopP7uoQk1EL13LUAI=";
    };

    nativeBuildInputs = [pkgs.autoPatchelfHook];

    buildInputs = [pkgs.stdenv.cc.cc.lib];

    installPhase = ''
      mkdir -p $out/bin
      tar -xzf $src -C $out/bin surreal
      chmod +x $out/bin/surreal
    '';

    meta = with pkgs.lib; {
      mainProgram = "surreal";
      platforms = ["x86_64-linux" "aarch64-linux"];
      sourceProvenance = with sourceTypes; [binaryNativeCode];
    };
  };
  surrealistx = pkgs.surrealist.overrideAttrs (finalAttrs: prev: {
    version = "3.9.1";

    src = pkgs.fetchFromGitHub {
      owner = "surrealdb";
      repo = "surrealist";
      rev = "surrealist-v${finalAttrs.version}";
      hash = "sha256-sxI+zndT62E9BWW7CQsnhMBZ3/cPbWTofPmtLujw7j4=";
    };

    cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
      inherit (finalAttrs) src cargoRoot;
      hash = "sha256-uJIAUkjvvOrepTk1uCFfjnFX/qt9EZZ/t2i0GejlDH8=";
    };

    nativeBuildInputs = prev.nativeBuildInputs ++ [pkgs.autoPatchelfHook];
    dontAutoPatchelf = true;

    postConfigure = ''
      autoPatchelf node_modules/sass-embedded-linux-x64/dart-sass/src/dart
    '';

    node_modules = prev.node_modules.overrideAttrs (_: {
      inherit (finalAttrs) src version;
      dontPatchShebangs = true;
      outputHash = "sha256-e79+cZfQlPqMtWxLBdc44szTbi4vXDifgydbtGo7FIw=";
    });

    postFixup = ''
      wrapProgram "$out/bin/surrealist" \
        --set GIO_EXTRA_MODULES ${pkgs.glib-networking}/lib/gio/modules \
        --set WEBKIT_DISABLE_COMPOSITING_MODE 1 \
        --set GDK_BACKEND x11
      substituteInPlace $out/share/applications/Surrealist.desktop \
        --replace-fail 'Exec=surrealist' 'Exec=surrealist %U'
    '';
  });
}
