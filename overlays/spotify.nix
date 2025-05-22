final: pkgs: {
  spotify-custom = pkgs.stdenv.mkDerivation rec {
    pname = "spotify";
    version = "1.2.63.394.g126b0d89";

    src = pkgs.fetchurl {
      url = "https://api.snapcraft.io/api/v1/snaps/download/pOBIoZ2LrCB3rDohMxoYGnbN14EHOgD7_88.snap";
      hash = "sha512-3Jk2YDXSKGJ8hGATGMt8KbOQul1VK/YApmq5j/BWBPjzRVn/j9etzIsYMWCFjpWf4KSvlrZnKuq3gL6SRyDsUA==";
    };

    nativeBuildInputs = with pkgs; [
      wrapGAppsHook3
      makeShellWrapper
      squashfsTools
    ];

    dontStrip = true;
    dontPatchELF = true;

    unpackPhase = ''
      runHook preUnpack
      unsquashfs "$src" '/usr/share/spotify' '/usr/bin/spotify' '/meta/snap.yaml'
      cd squashfs-root
      if ! grep -q 'grade: stable' meta/snap.yaml; then
        # Unfortunately this check is not reliable: At the moment (2018-07-26) the
        # latest version in the "edge" channel is also marked as stable.
        echo "The snap package is marked as unstable:"
        grep 'grade: ' meta/snap.yaml
        echo "You probably chose the wrong revision."
        exit 1
      fi
      if ! grep -q '${version}' meta/snap.yaml; then
        echo "Package version differs from version found in snap metadata:"
        grep 'version: ' meta/snap.yaml
        echo "While the nix package specifies: ${version}."
        echo "You probably chose the wrong revision or forgot to update the nix version."
        exit 1
      fi
      runHook postUnpack
    '';

    dontWrapGApps = true;

    env = rec {
      libdir = "${placeholder "out"}/lib/spotify";
      librarypath = let
        deps = with pkgs; [
          alsa-lib
          at-spi2-atk
          at-spi2-core
          atk
          cairo
          cups
          curlWithGnuTls
          dbus
          expat
          ffmpeg_4
          fontconfig
          freetype
          gdk-pixbuf
          glib
          gtk3
          harfbuzz
          libayatana-appindicator
          libdbusmenu
          libdrm
          libgcrypt
          libGL
          libnotify
          libpng
          libpulseaudio
          libxkbcommon
          libgbm
          nss_latest
          pango
          stdenv.cc.cc
          systemd
          xorg.libICE
          xorg.libSM
          xorg.libX11
          xorg.libxcb
          xorg.libXcomposite
          xorg.libXcursor
          xorg.libXdamage
          xorg.libXext
          xorg.libXfixes
          xorg.libXi
          xorg.libXrandr
          xorg.libXrender
          xorg.libXScrnSaver
          xorg.libxshmfence
          xorg.libXtst
          zlib
        ];
      in "${pkgs.lib.makeLibraryPath deps}:${libdir}";
    };

    installPhase = with pkgs; ''
      runHook preInstall

      mkdir -p $libdir
      mv ./usr/* $out/

      # Work around Spotify referring to a specific minor version of
      # OpenSSL.

      ln -s ${lib.getLib openssl}/lib/libssl.so $libdir/libssl.so.1.0.0
      ln -s ${lib.getLib openssl}/lib/libcrypto.so $libdir/libcrypto.so.1.0.0
      ln -s ${nspr.out}/lib/libnspr4.so $libdir/libnspr4.so
      ln -s ${nspr.out}/lib/libplc4.so $libdir/libplc4.so

      ln -s ${ffmpeg_4.lib}/lib/libavcodec.so* $libdir
      ln -s ${ffmpeg_4.lib}/lib/libavformat.so* $libdir

      rpath="$out/share/spotify:$libdir"

      chmod +w "$out/share/spotify/spotify"
      patchelf \
        --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
        --set-rpath $rpath $out/share/spotify/spotify

      # fix Icon line in the desktop file (#48062)
      sed -i "s:^Icon=.*:Icon=spotify-client:" "$out/share/spotify/spotify.desktop"

      # Desktop file
      mkdir -p "$out/share/applications/"
      cp "$out/share/spotify/spotify.desktop" "$out/share/applications/"

      # Icons
      for i in 16 22 24 32 48 64 128 256 512; do
        ixi="$i"x"$i"
        mkdir -p "$out/share/icons/hicolor/$ixi/apps"
        ln -s "$out/share/spotify/icons/spotify-linux-$i.png" \
          "$out/share/icons/hicolor/$ixi/apps/spotify-client.png"
      done

      runHook postInstall
    '';

    fixupPhase = ''
      runHook preFixup

      wrapProgramShell $out/share/spotify/spotify \
        ''${gappsWrapperArgs[@]} \
        --prefix LD_LIBRARY_PATH : "$librarypath" \
        --prefix PATH : "${pkgs.zenity}/bin" \
        --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime=true}}"

      runHook postFixup
    '';
  };
}
