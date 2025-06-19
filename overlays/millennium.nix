# Broken, just as on arch linux, waiting for a fix
final: pkgs: {
  millennium = let
    mini = pkgs.stdenvNoCC.mkDerivation rec {
      pname = "mini";
      version = "0.9.18";

      src = pkgs.fetchFromGitHub {
        owner = "metayeti";
        repo = "mINI";
        rev = "${version}";
        sha256 = "sha256-zBFFOlECbie7+62fTGf+NP4gNmfv2Qddw3ys6xn7o9U=";
      };
      dontBuild = true;
      installPhase = ''
        mkdir -p "$out/include"
        cp -r $src/src/mini "$out/include/"
      '';
    };
    # Use outdated curl to match one from steam-runtime/pinned_libs_32
    curl_7 = pkgs.pkgsi686Linux.stdenv.mkDerivation (finalAttrs: {
      pname = "curl";
      version = "7.88.1";

      src = pkgs.pkgsi686Linux.fetchurl {
        urls = [
          "https://curl.haxx.se/download/curl-${finalAttrs.version}.tar.bz2"
          "https://github.com/curl/curl/releases/download/curl-${finalAttrs.version}/curl-${finalAttrs.version}.tar.bz2"
        ];
        hash = "sha256-giS0XM4Sq94DnBLcBxG36oWxBLmtU01uTFtOGIphyQc=";
      };

      outputs = ["bin" "dev" "out" "man" "devdoc"];
      separateDebugInfo = true;

      enableParallelBuilding = true;

      strictDeps = true;

      nativeBuildInputs = with pkgs.pkgsi686Linux; [pkg-config perl];

      propagatedBuildInputs = with pkgs.pkgsi686Linux; [
        nghttp2
        openssl
        libssh2
        zlib
      ];
      preConfigure = ''
        sed -e 's|/usr/bin|/no-such-path|g' -i.bak configure
        rm src/tool_hugehelp.c
      '';

      configureFlags = [
        "--disable-manual"
        (pkgs.lib.withFeature true "ca-fallback")
        (pkgs.lib.withFeatureAs true "openssl" (pkgs.lib.getDev pkgs.pkgsi686Linux.openssl))
        (pkgs.lib.withFeatureAs true "libssh2" (pkgs.lib.getDev pkgs.pkgsi686Linux.libssh2))
      ];

      CXX = "${pkgs.pkgsi686Linux.stdenv.cc.targetPrefix}c++";
      CXXCPP = "${pkgs.pkgsi686Linux.stdenv.cc.targetPrefix}c++ -E";

      doCheck = false;
      preCheck = ''
        patchShebangs tests/
      '';

      postInstall = ''
        moveToOutput bin/curl-config "$dev"

        # Install completions
        make -C scripts install
        sed '/^dependency_libs/s|${pkgs.lib.getDev pkgs.pkgsi686Linux.libssh2}|${pkgs.lib.getLib pkgs.pkgsi686Linux.libssh2}|' -i "$out"/lib/*.la
      '';

      passthru = let
        useThisCurl = attr: attr.override {curl = finalAttrs.finalPackage;};
      in {
        inherit (pkgs.pkgsi686Linux.openssl);
      };
    });
  in
    pkgs.stdenv_32bit.mkDerivation rec {
      pname = "millennium";
      version = "2.25.1";

      src = pkgs.fetchFromGitHub {
        owner = "SteamClientHomebrew";
        repo = "Millennium";
        rev = "v${version}";
        sha256 = "sha256-c5jbAm50XDWuD2GLMRk134FJtHnRu82Rd9TusV80fio=";
      };

      buildInputs = with pkgs; [
        pkgsi686Linux.python311
        curl_7
        cmake
        ninja
        gcc.cc.lib
        cli11
        nlohmann_json
        fmt
        mini
        websocketpp
        asio
        crow
        libcxx
      ];

      patchPhase = ''
        sed -i "s|/usr/lib/millennium|$out/lib|g" CMakeLists.txt
      '';

      configurePhase = ''
        cmake -G Ninja -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DVCPKG_TARGET_TRIPLET=x86-linux \
        -DCMAKE_C_FLAGS="-m32" \
        -DCMAKE_CXX_FLAGS="-m32"
      '';

      buildPhase = ''
        cmake --build build --config Release
      '';
      installPhase = ''
        cmake --install build --prefix $out
        mkdir -p $out/lib
        cp build/libmillennium_x86.so $out/lib/
        mv $out/bin/millennium $out/bin/millennium-cli
        cp ${src}/scripts/posix/start.sh $out/bin/millennium
      '';
      postFixup = ''
        substituteInPlace $out/bin/millennium \
          --replace '/usr/lib/millennium' "$out/lib" \
          --replace '/usr/lib/steam/bin_steam.sh' '/run/current-system/sw/bin/steam'
      '';
      NIX_CFLAGS_COMPILE = ["-isystem ${pkgs.pkgsi686Linux.python311}/include/${pkgs.pkgsi686Linux.python311.libPrefix}"];
      NIX_LDFLAGS = ["-l${pkgs.pkgsi686Linux.python311.libPrefix}"];
    };
}
