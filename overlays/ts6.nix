final: pkgs: {
  ts6 = pkgs.stdenv.mkDerivation rec {
    pname = "teamspeak6-client";
    version = "6.0.0-beta2";

    src = pkgs.fetchurl {
      url = "https://files.teamspeak-services.com/pre_releases/client/${version}/teamspeak-client.tar.gz";
      sha256 = "de334fbf7b90d91ced475a785d034b520e4856bbd6fdd71db6a5dd88624a552b";
    };

    sourceRoot = ".";

    propagatedBuildInputs = with pkgs; [
      alsa-lib
      at-spi2-atk
      atk
      cairo
      cups.lib
      dbus
      gcc-unwrapped.lib
      gdk-pixbuf
      glib
      gtk3
      libdrm
      libnotify
      libpulseaudio
      libxkbcommon
      libgbm
      nss
      xorg.libX11
      xorg.libXScrnSaver
      xorg.libXdamage
      xorg.libXfixes
      xorg.libxshmfence
      xorg.libXtst
      wayland
    ];

    nativeBuildInputs = with pkgs; [
      autoPatchelfHook
      copyDesktopItems
      makeWrapper
    ];

    desktopItems = [
      (pkgs.makeDesktopItem {
        name = "TeamSpeak";
        exec = "TeamSpeak";
        icon = pname;
        desktopName = pname;
        comment = "TeamSpeak Voice Communication Client";
        categories = [
          "Audio"
          "AudioVideo"
          "Chat"
          "Network"
        ];
      })
    ];

    dontConfigure = true;
    dontBuild = true;

    installPhase = ''
      runHook preInstall

      mkdir -p $out/bin $out/share/${pname} $out/share/icons/hicolor/64x64/apps/

      cp -a * $out/share/${pname}
      cp logo-256.png $out/share/icons/hicolor/64x64/apps/${pname}.png

      makeWrapper $out/share/${pname}/TeamSpeak $out/bin/TeamSpeak \
        --prefix LD_LIBRARY_PATH : "${
        pkgs.lib.makeLibraryPath (with pkgs; [
          udev
          libGL
        ])
      }" \
        --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --enable-wayland-ime=true}}"

      runHook postInstall
    '';
  };
}
