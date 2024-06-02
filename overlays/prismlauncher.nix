{ pkgs
, ...
}: 
let
  glfw = pkgs.glfw-wayland-minecraft;
in
pkgs.prismlauncher.override {
  jdks = with pkgs; [ jdk8 jdk17 openjdk21 zulu ];
  additionalLibs = [pkgs.libva];
  inherit glfw;
}