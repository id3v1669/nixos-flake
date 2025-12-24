final: pkgs: {
  # equibop = pkgs.equibop.override {
  #   inherit (pkgs) electron;
  # };
  equibop = pkgs.stdenv.mkDerivation (finalAttrs: {
    pname = "equibop";
    version = "3.1.4";

    src = pkgs.fetchFromGitHub {
      owner = "Equicord";
      repo = "Equibop";
      tag = "v${finalAttrs.version}";
      hash = "sha256-ASU2a4CtlvglHWzv0AASuEWeycfBfSpi+ZuHsu6K0ko=";
    };

    postPatch = ''
      substituteInPlace scripts/build/build.mts \
        --replace-fail 'const gitHash = execSync("git rev-parse HEAD", { encoding: "utf-8" }).trim();' 'const gitHash = "${pkgs.lib.fakeHash}"'

      # disable auto updates
      substituteInPlace src/main/updater.ts \
        --replace-fail 'const isOutdated = autoUpdater.checkForUpdates().then(res => Boolean(res?.isUpdateAvailable));' 'const isOutdated = false;'
    '';

    node-modules = pkgs.callPackage ./node-modules.nix {};

    nativeBuildInputs = with pkgs; [
      bun
      nodejs
      autoPatchelfHook
      copyDesktopItems
      makeWrapper
    ];

    buildInputs = with pkgs; [
      libpulseaudio
      pipewire
      (lib.getLib stdenv.cc.cc)
    ];

    configurePhase = ''
      runHook preConfigure

      cp -R ${finalAttrs.node-modules} node_modules

      runHook postConfigure
    '';

    buildPhase = ''
      runHook preBuild

      bun run build

      bun run compileArrpc

      # can't run it via bunx / npx since fixupPhase was skipped for node_modules
      node node_modules/electron-builder/out/cli/cli.js \
        --dir \
        -c.electronDist=${pkgs.electron.dist} \
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
      makeWrapper ${pkgs.electron}/bin/electron $out/bin/equibop \
        --add-flags $out/opt/Equibop/resources/app.asar \
        --add-flags "--enable-speech-dispatcher" \
        --add-flags "--enable-gpu-rasterization" \
        --add-flags "--enable-zero-copy" \
        --add-flags "--ignore-gpu-blocklist" \
        --add-flags "--enable-hardware-overlays" \
        --add-flags "--enable-features=VaapiVideoDecoder,VaapiVideoEncoder,CanvasOopRasterization,UseOzonePlatform" \
        --add-flags "--disable-features=UseChromeOSDirectVideoDecoder" \
        --add-flags "--enable-accelerated-video-decode" \
        --add-flags "--enable-accelerated-2d-canvas" \
        --add-flags "--disable-software-rasterizer" \
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
      inherit (finalAttrs) node-modules;
    };

    meta = {
      mainProgram = "equibop";
    };
  });
}
