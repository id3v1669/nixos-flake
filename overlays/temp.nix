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
    version = "1.4.6";

    src = pkgs.fetchFromGitHub {
      owner = "waycrate";
      repo = "wayshot";
      rev = "bef196d31d5fc837a24f9cd2e8b75fcf83dcb9d2";
      hash = "sha256-rxE5hSfWMR7NQNdVTVBH8GL2dVZD2tnt1iRJMHJKnPQ=";
    };

    cargoHash = "sha256-ZbYCifFug7TZVxng1NINdHgSdKsH1NLvYpvw5ENPn2Y=";

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
