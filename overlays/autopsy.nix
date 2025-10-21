final: pkgs: {
  autopsy = let
    jdkWithJfx = pkgs.jdk.override (
      pkgs.lib.optionalAttrs pkgs.stdenv.hostPlatform.isLinux {
        enableJavaFX = true;
      }
    );
    sleuthkit = pkgs.callPackage ./sleuthkit.nix {};
  in
    pkgs.stdenv.mkDerivation rec {
      pname = "autopsy";
      version = "4.22.1";

      src = pkgs.fetchzip {
        url = "https://github.com/sleuthkit/autopsy/releases/download/autopsy-4.22.1/autopsy-4.22.1_v2.zip";
        hash = "sha256-IHpUzwSXoghjixsPwpj3lMwHIby3+zx7BjzGRlAVcVs=";
      };

      nativeBuildInputs = with pkgs; [
        makeWrapper
        findutils
        perl
      ];
      buildInputs = with pkgs; [
        testdisk
        imagemagick
        jdkWithJfx
        sleuthkit
      ];

      installPhase = ''
        runHook preInstall

        cp -r . $out

        # Run the provided setup script to make files executable and copy sleuthkit
        TSK_JAVA_LIB_PATH="${sleuthkit}/share/java" bash $out/unix_setup.sh -j '${jdkWithJfx}' -n autopsy

        # --add-flags "--nosplash" -> https://github.com/sleuthkit/autopsy/issues/6980
        substituteInPlace $out/bin/autopsy \
          --replace-warn 'APPNAME=`basename "$PRG"`' 'APPNAME=autopsy'
        wrapProgram $out/bin/autopsy \
          --add-flags "--nosplash" \
          --run 'export SOLR_LOGS_DIR="$HOME/.autopsy/dev/var/log"' \
          --run 'export SOLR_PID_DIR="$HOME/.autopsy/dev"' \
          --prefix PATH : "${
          pkgs.lib.makeBinPath (with pkgs; [
            perl
            testdisk
            imagemagick
            jdkWithJfx
          ])
        }"

        runHook postInstall
      '';
    };
}
