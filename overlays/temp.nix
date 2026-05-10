final: pkgs: {
  wayshot = pkgs.rustPlatform.buildRustPackage (finalAttrs: {
    pname = "wayshot";
    version = "1.4.6";

    src = pkgs.fetchFromGitHub {
      owner = "waycrate";
      repo = "wayshot";
      rev = "a3d22fc315d9236828a556cb661959c00e4076c6";
      hash = "sha256-G94GpvIwfuGU/BorJkgoCNgLa1FJ3P2RDnOlENv7Kk0=";
    };

    cargoHash = "sha256-nVgLQawBdjrkAK/cZA0dMbLPvFsXXJOZBe2Uwh+G1dM=";

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
  coldlock = pkgs.rustPlatform.buildRustPackage rec {
    pname = "coldlock";
    version = "0.1.0";

    src = pkgs.lib.cleanSource /home/user/tmpmy/ColdLock;

    cargoLock.lockFile = "${src}/Cargo.lock";

    nativeBuildInputs = with pkgs; [
      pkg-config
      autoPatchelfHook
      rustPlatform.bindgenHook
    ];

    runtimeDependencies = with pkgs; [
      wayland
      libxkbcommon
      libGL
      vulkan-loader
    ];

    buildInputs = with pkgs;
      [
        linux-pam
        libclang
      ]
      ++ runtimeDependencies;
  };
}
