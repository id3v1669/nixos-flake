{
  lib,
  stdenv,
  fetchurl,
  dpkg,
  autoPatchelfHook,
  makeWrapper,
  wrapGAppsHook3,
  alsa-lib,
  at-spi2-atk,
  at-spi2-core,
  cairo,
  cups,
  dbus,
  expat,
  fontconfig,
  freetype,
  glib,
  gtk3,
  libdrm,
  libcap_ng,
  libgbm,
  libGL,
  libnotify,
  libpulseaudio,
  libseccomp,
  libsecret,
  libuuid,
  libx11,
  libxcb,
  libxcomposite,
  libxdamage,
  libxext,
  libxfixes,
  libxkbcommon,
  libxrandr,
  libxtst,
  nspr,
  nss,
  pango,
  pipewire,
  systemdLibs,
  xdg-utils,
}: let
  source = builtins.fromJSON (builtins.readFile ./source.json);
in
  stdenv.mkDerivation (finalAttrs: {
    pname = "claude-desktop";
    version = source.version;

    src = fetchurl {
      inherit (source) url sha256;
    };

    nativeBuildInputs = [
      dpkg
      autoPatchelfHook
      makeWrapper
      wrapGAppsHook3
    ];

    buildInputs = [
      alsa-lib
      at-spi2-atk
      at-spi2-core
      cairo
      cups
      dbus
      expat
      fontconfig
      freetype
      glib
      gtk3
      libcap_ng
      libdrm
      libgbm
      libseccomp
      libuuid
      libx11
      libxcb
      libxcomposite
      libxdamage
      libxext
      libxfixes
      libxkbcommon
      libxrandr
      libxtst
      nspr
      nss
      pango
      systemdLibs
      stdenv.cc.cc.lib
    ];

    runtimeDependencies = [
      libnotify
      libpulseaudio
      libsecret
      pipewire
    ];

    unpackCmd = ''dpkg-deb -x "$curSrc" source'';
    sourceRoot = "source";

    dontBuild = true;
    dontConfigure = true;

    dontWrapGApps = true;

    installPhase = ''
      runHook preInstall

      mkdir -p $out/lib $out/share
      cp -r usr/lib/claude-desktop $out/lib/
      cp -r usr/share/applications usr/share/icons $out/share/

      makeWrapper $out/lib/claude-desktop/claude-desktop $out/bin/claude-desktop \
        "''${gappsWrapperArgs[@]}" \
        --prefix PATH : ${lib.makeBinPath [xdg-utils]} \
        --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [libGL]} \
        --add-flags "--password-store=basic" \
        --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations}}"

      substituteInPlace $out/share/applications/*.desktop \
        --replace-fail "Exec=claude-desktop" "Exec=$out/bin/claude-desktop"

      runHook postInstall
    '';

    meta = {
      description = "Desktop application for Claude.ai";
      homepage = "https://claude.ai/download";
      downloadPage = "https://code.claude.com/docs/en/desktop-linux";
      license = lib.licenses.unfree;
      sourceProvenance = [lib.sourceTypes.binaryNativeCode];
      platforms = ["x86_64-linux"];
      mainProgram = "claude-desktop";
    };
  })
