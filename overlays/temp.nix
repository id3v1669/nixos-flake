final: pkgs: {
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
  wayshot = pkgs.rustPlatform.buildRustPackage (finalAttrs: {
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
