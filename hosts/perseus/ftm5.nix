{ nixpkgs, kernel ? import ./kernel.nix { inherit nixpkgs; } }:
let
  pkgs = import nixpkgs {
    localSystem = "x86_64-linux";
    crossSystem = "aarch64-linux";
  };
in
pkgs.stdenv.mkDerivation {
  name = "ftm5-module";
  src = ./drivers/touch/ftm5;
  nativeBuildInputs = kernel.moduleBuildDependencies;
  makeFlags = [
    "ARCH=arm64"
    "CROSS_COMPILE=${pkgs.stdenv.cc.targetPrefix}"
    "KDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
  ];
  installPhase = ''
    mkdir -p "$out"
    cp ftm5.ko "$out/"
  '';
}
