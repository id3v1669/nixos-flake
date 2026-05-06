final: pkgs: {
  equibop = let
    version = "3.2.0";

    node-modules = pkgs.stdenvNoCC.mkDerivation {
      pname = "equibop-modules";
      inherit version;
      src = pkgs.fetchFromGitHub {
        owner = "Equicord";
        repo = "Equibop";
        tag = "v${version}";
        hash = "sha256-CPRn1F15N4Rjry91Gu+ZXWpKVTOEnHI3TmZn8502QB4=";
      };

      impureEnvVars =
        pkgs.lib.fetchers.proxyImpureEnvVars
        ++ [
          "GIT_PROXY_COMMAND"
          "SOCKS_SERVER"
        ];

      nativeBuildInputs = with pkgs; [
        bun
        writableTmpDirAsHomeHook
      ];

      dontConfigure = true;
      dontFixup = true;

      buildPhase = ''
        runHook preBuild

        export BUN_INSTALL_CACHE_DIR=$(mktemp -d)

        bun install \
          --filter=equibop \
          --force \
          --frozen-lockfile \
          --ignore-scripts \
          --linker=hoisted \
          --no-progress

        runHook postBuild
      '';

      installPhase = ''
        runHook preInstall

        cp -R ./node_modules $out

        runHook postInstall
      '';

      outputHash = "sha256-p8jx9HDYG2q2nhBiBK8XDTYm9O0ptTqv8L+PrQ8oiy8=";
      outputHashAlgo = "sha256";
      outputHashMode = "recursive";
    };
  in
    pkgs.stdenv.mkDerivation (finalAttrs: {
      pname = "equibop";
      inherit version;
      src = pkgs.fetchFromGitHub {
        owner = "Equicord";
        repo = "Equibop";
        tag = "v${version}";
        hash = "sha256-CPRn1F15N4Rjry91Gu+ZXWpKVTOEnHI3TmZn8502QB4=";
      };

      postPatch = ''
        substituteInPlace scripts/build/build.mts \
          --replace-fail 'gitHash = execSync("git rev-parse HEAD", { encoding: "utf-8" }).trim();' 'gitHash = "${finalAttrs.src.hash}"'

        substituteInPlace src/main/updater.ts \
          --replace-fail 'const isOutdated = autoUpdater.checkForUpdates().then(res => Boolean(res?.isUpdateAvailable));' 'const isOutdated = false;'
      '';

      nativeBuildInputs = with pkgs; [
        bun
        nodejs
        autoPatchelfHook
        copyDesktopItems
        makeWrapper
      ];

      buildInputs = with pkgs; [
        arrpc
        libpulseaudio
        pipewire
        (pkgs.lib.getLib stdenv.cc.cc)
      ];

      configurePhase = ''
        runHook preConfigure

        cp -R ${node-modules} node_modules
        chmod -R u+w node_modules

        runHook postConfigure
      '';

      buildPhase = ''
        runHook preBuild

        bun run build

        export ELECTRON_SKIP_BINARY_DOWNLOAD=1

        chmod -R u+w ${pkgs.electron.dist} 2>/dev/null || cp -r ${pkgs.electron.dist} electron-dist && chmod -R u+w electron-dist && export ELECTRON_DIST=$PWD/electron-dist

        node node_modules/electron-builder/out/cli/cli.js \
          --dir \
          -c.electronDist=''${ELECTRON_DIST:-${pkgs.electron.dist}} \
          -c.electronVersion=${pkgs.electron.version} \
          -c.npmRebuild=false

        runHook postBuild
      '';

      postBuild = ''
        pushd build
        ${pkgs.libicns}/bin/icns2png -x icon.icns
        popd
      '';

      installPhase = ''
        runHook preInstall
        mkdir -p $out/opt/Equibop
        cp -r dist/*unpacked/resources $out/opt/Equibop/

        for file in build/icon_*x32.png; do
          file_suffix=''${file//build\/icon_}
          install -Dm0644 $file $out/share/icons/hicolor/''${file_suffix//x32.png}/apps/equibop.png
        done

        runHook postInstall
      '';

      postFixup = ''
        mkdir -p $out/opt/Equibop/resources/static/dist
        ln -sf ${pkgs.arrpc}/bin/arrpc $out/opt/Equibop/resources/static/dist/arrpc-linux-x64
        
        makeWrapper ${pkgs.electron}/bin/electron $out/bin/equibop \
          --add-flags $out/opt/Equibop/resources/app.asar \
          --add-flags "--enable-gpu-rasterization" \
          --add-flags "--enable-zero-copy" \
          --add-flags "--ignore-gpu-blocklist" \
          --add-flags "--enable-hardware-overlays" \
          --add-flags "--enable-features=VaapiVideoDecoder,VaapiVideoEncoder,CanvasOopRasterization" \
          --add-flags "--disable-features=UseChromeOSDirectVideoDecoder" \
          --add-flags "--enable-accelerated-2d-canvas" \
          --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --enable-wayland-ime=true}}"
      '';

      desktopItems = pkgs.makeDesktopItem {
        name = "equibop";
        desktopName = "Equibop";
        exec = "equibop %U";
        icon = "equibop";
        startupWMClass = "Equibop";
        genericName = "Internet Messenger";
        keywords = [
          "discord"
          "equibop"
          "electron"
          "chat"
        ];
        categories = [
          "Network"
          "InstantMessaging"
          "Chat"
        ];
      };

      passthru = {
        inherit node-modules;
      };

      meta = {
        mainProgram = "equibop";
        description = "equibop";
      };
    });
}
