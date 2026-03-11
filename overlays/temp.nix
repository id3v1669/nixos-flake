final: pkgs: {
  waysip = pkgs.rustPlatform.buildRustPackage rec {
      pname = "waysip";
      version = "0.6.0";

      src = pkgs.fetchFromGitHub {
        owner = "waycrate";
        repo = "waysip";
        rev = "2e53cff144d4ca0484b05aa1a8baa8475c31def6";
        hash = "sha256-46MJRWZFFaHU/y1hOK5ji6PvpdiqYhf5A4G/RTcg2o4=";
      };

      cargoHash = "sha256-uFBXJdknDjrqeE3nAiRTavykPgqzOxR/nK40rnbSGb8=";

      nativeBuildInputs = with pkgs; [
        pkg-config
      ];

      buildInputs = with pkgs; [
        glib
        pango
      ];
    };
  lsfg-vk = pkgs.llvmPackages.stdenv.mkDerivation rec {
    pname = "lsfg-vk";
    version = "1.0.0-git";

    src = pkgs.fetchFromGitHub {
      owner = "PancakeTAS";
      repo = "lsfg-vk";
      rev = "f17e9ce746ba3fe2dc46e5a22145af6fb389c615";
      hash = "sha256-ygNmidny1n+M54aJ36wsYbgpaO/+I0mbZ8jaCESo2rM=";
      fetchSubmodules = true;
    };

    postInstall = ''
      substituteInPlace $out/share/vulkan/implicit_layer.d/VkLayer_LSFGVK_frame_generation.json \
        --replace-fail "liblsfg-vk-layer.so" "$out/lib/liblsfg-vk-layer.so"
    '';

    nativeBuildInputs = with pkgs; [
      llvmPackages.clang-tools
      llvmPackages.libllvm
      cmake
    ];

    buildInputs = [
      pkgs.vulkan-headers
    ];
  };
  wayshot = let 
    waysip = pkgs.rustPlatform.buildRustPackage rec {
      pname = "waysip";
      version = "0.6.0";

      src = pkgs.fetchFromGitHub {
        owner = "waycrate";
        repo = "waysip";
        rev = "2e53cff144d4ca0484b05aa1a8baa8475c31def6";
        hash = "sha256-46MJRWZFFaHU/y1hOK5ji6PvpdiqYhf5A4G/RTcg2o4=";
      };

      cargoHash = "sha256-uFBXJdknDjrqeE3nAiRTavykPgqzOxR/nK40rnbSGb8=";

      nativeBuildInputs = with pkgs; [
        pkg-config
      ];

      buildInputs = with pkgs; [
        glib
        pango
        #cairo
      ];
      # postFixup = ''
      #   patchelf $out/bin/waysip \
      #     --add-rpath ${lib.makeLibraryPath buildInputs}
      # '';
    };
  in pkgs.rustPlatform.buildRustPackage (finalAttrs: {
    pname = "wayshot";
    version = "1.4.5";

    src = pkgs.fetchFromGitHub {
      owner = "waycrate";
      repo = "wayshot";
      rev = "v${finalAttrs.version}";
      hash = "sha256-Xw3UN0linKp0jcAYYE0eX7x/bQ97gIQPDCIY9tlEhN4=";
    };

    cargoHash = "sha256-z5cqpC+Yt0PsEj9iab+7buO+OudbtzNYJulEUE10eZY=";

    nativeBuildInputs = with pkgs; [
      pkg-config
      waysip
    ];

    buildInputs = with pkgs; [
      pango
      libgbm
      libjxl
      libGL
      wayland
    ];
  });
}
