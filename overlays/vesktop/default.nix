{ lib
, stdenv
, stdenvNoCC
, gcc13Stdenv
, fetchFromGitHub
, substituteAll
, makeWrapper
, makeDesktopItem
, copyDesktopItems
, vencord
, electron
, pipewire
, libicns
, libnotify
, jq
, moreutils
, nodePackages
, cacert
, pkgs
}:
let
  vencord = pkgs.vencord.overrideAttrs (old: {
    src = fetchFromGitHub {
      owner = "Vendicated";
      repo = "Vencord";
      rev = "v1.6.7";
      hash = "sha256-opQm0/nBt0O9iVPbLJAn5G2wPe20mhWroG0Y7ug3S7A=";
    };
  });
in
stdenv.mkDerivation rec {
  pname = "vesktop";
  version = "1.5.0";

  src = fetchFromGitHub {
    owner = "Vencord";
    repo = "Vesktop";
    rev = "v${version}";
    hash = "sha256-27998q9wbaNP1xYY+KHTBeJRfR6Q/K0LNdbRb3YHC6c=";
  };

  pnpmDeps =
    assert lib.versionAtLeast nodePackages.pnpm.version "8.10.0";
    stdenvNoCC.mkDerivation {
      pname = "${pname}-pnpm-deps";
      inherit src version patches ELECTRON_SKIP_BINARY_DOWNLOAD;

      nativeBuildInputs = [
        jq
        moreutils
        nodePackages.pnpm
        cacert
      ];

      pnpmPatch = builtins.toJSON {
        pnpm.supportedArchitectures = {
          os = [ "linux" ];
          cpu = [ "x64" "arm64" ];
        };
      };

      postPatch = ''
        mv package.json package.json.orig
        jq --raw-output ". * $pnpmPatch" package.json.orig > package.json
      '';

      installPhase = ''
        export HOME=$(mktemp -d)

        pnpm config set store-dir $out
        pnpm install --frozen-lockfile --ignore-script

        rm -rf $out/v3/tmp
        for f in $(find $out -name "*.json"); do
          sed -i -E -e 's/"checkedAt":[0-9]+,//g' $f
          jq --sort-keys . $f | sponge $f
        done
      '';

      dontBuild = true;
      dontFixup = true;
      outputHashMode = "recursive";
      outputHash = "sha256-cnk+KFdvsgG1wGDib7zgIS6/RkrR5EYAHtHcrFSU0Es=";
    };

  nativeBuildInputs = [
    copyDesktopItems
    nodePackages.pnpm
    nodePackages.nodejs
    makeWrapper
  ];

  patches = [
    (substituteAll { inherit vencord; src = ./use_system_vencord.patch; })
  ];

  ELECTRON_SKIP_BINARY_DOWNLOAD = 1;

  preBuild = ''
    export HOME=$(mktemp -d)
    export STORE_PATH=$(mktemp -d)

    cp -Tr "$pnpmDeps" "$STORE_PATH"
    chmod -R +w "$STORE_PATH"

    pnpm config set store-dir "$STORE_PATH"
    pnpm install --offline --frozen-lockfile --ignore-script
    patchShebangs node_modules/{*,.*}
  '';

  postBuild = ''
    pnpm build
    # using `pnpm exec` here apparently makes it ignore ELECTRON_SKIP_BINARY_DOWNLOAD
    ./node_modules/.bin/electron-builder \
      --dir \
      -c.electronDist=${electron}/libexec/electron \
      -c.electronVersion=${electron.version}
  '';

  installPhase =
    let
      libPath = lib.makeLibraryPath [
        libnotify
        pipewire
        gcc13Stdenv.cc.cc.lib
      ];
    in
    ''
      runHook preInstall

      mkdir -p $out/opt/Vesktop/resources
      cp dist/linux-*unpacked/resources/app.asar $out/opt/Vesktop/resources

      pushd build
      ${libicns}/bin/icns2png -x icon.icns
      for file in icon_*x32.png; do
        file_suffix=''${file//icon_}
        install -Dm0644 $file $out/share/icons/hicolor/''${file_suffix//x32.png}/apps/vencorddesktop.png
      done

      makeWrapper ${electron}/bin/electron $out/bin/vencorddesktop \
        --prefix LD_LIBRARY_PATH : ${libPath} \
        --add-flags $out/opt/Vesktop/resources/app.asar \
        --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations}}"

      runHook postInstall
    '';

  desktopItems = [
    (makeDesktopItem {
      name = "vencorddesktop";
      desktopName = "Vesktop";
      exec = "vencorddesktop %U";
      icon = "vencorddesktop";
      startupWMClass = "VencordDesktop";
      genericName = "Internet Messenger";
      keywords = [ "discord" "vencord" "electron" "chat" ];
      categories = [ "Network" "InstantMessaging" "Chat" ];
    })
  ];

  passthru = {
    inherit pnpmDeps;
  };
}