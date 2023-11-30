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
, jq
, moreutils
, nodePackages
, pkgs
}:
let
  vencord = pkgs.vencord.overrideAttrs (old: {
    src = fetchFromGitHub {
      owner = "Vendicated";
      repo = "Vencord";
      rev = "v1.6.4";
      hash = "sha256-JL6UwxI4lSkxWfrps1Z2Q97LrzU4Hp6zs8kK2MdqXs8=";
    };
  });
in
stdenv.mkDerivation rec {
  pname = "vesktop";
  version = "0.4.3";

  src = fetchFromGitHub {
    owner = "Vencord";
    repo = "Vesktop";
    rev = "v${version}";
    sha256 = "sha256-wGOyDGY0FpAVS5+MTiKrOpDyd13ng0RLGAENW5tXuR4="; #0.4.3
  };

  pnpm-deps = stdenvNoCC.mkDerivation {
    pname = "${pname}-pnpm-deps";
    inherit src version patches ELECTRON_SKIP_BINARY_DOWNLOAD;

    nativeBuildInputs = [
      jq
      moreutils
      nodePackages.pnpm
    ];

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

    dontFixup = true;
    outputHashMode = "recursive";
    outputHash = "sha256-R5/2MSH/jXHrj2x1Ap2OoOFLBLQp3Sq91o01uW8hWOw="; #0.4.3
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

    cp -r ${pnpm-deps}/* "$STORE_PATH"
    chmod -R +w "$STORE_PATH"

    pnpm config set store-dir "$STORE_PATH"
    pnpm install --offline --frozen-lockfile --ignore-script
    patchShebangs node_modules/{*,.*}
  '';

  postBuild = ''
    pnpm build
    ./node_modules/.bin/electron-builder \
      --dir \
      -c.electronDist=${electron}/libexec/electron \
      -c.electronVersion=${electron.version}
  '';

  installPhase =
    let
      libPath = lib.makeLibraryPath [
        pipewire
        gcc13Stdenv.cc.cc.lib
      ];
    in
    ''
      runHook preInstall

      mkdir -p $out/opt/Vesktop/resources
      cp dist/linux-unpacked/resources/app.asar $out/opt/Vesktop/resources

      pushd build
      ${libicns}/bin/icns2png -x icon.icns
      for file in icon_*x32.png; do
        file_suffix=''${file//icon_}
        install -Dm0644 $file $out/share/icons/hicolor/''${file_suffix//x32.png}/apps/vencorddesktop.png
      done

      makeWrapper '${lib.getExe electron}' $out/bin/vencorddesktop \
        --prefix LD_LIBRARY_PATH : ${libPath} \
        --add-flags $out/opt/Vesktop/resources/app.asar \
        --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations}}"

      runHook postInstall
    '';

  desktopItems = [
    (makeDesktopItem {
      name = "vencorddesktop";
      desktopName = "Vesktop";
      exec = "vencorddesktop %U --disable-gpu";
      icon = "vencorddesktop";
      startupWMClass = "VencordDesktop";
      genericName = "Internet Messenger";
      keywords = [ "discord" "vencord" "electron" "chat" ];
    })
  ];
}