{inputs, ...}: final: pkgs: {
  fht-compositor = inputs.fht-compositor.packages.${pkgs.stdenv.hostPlatform.system}.fht-compositor;
  #fht-compositor = inputs.fht-compositor.packages.${pkgs.stdenv.hostPlatform.system}.fht-compositor-debug;
  fht-share-picker = inputs.fht-share-picker.packages.${pkgs.stdenv.hostPlatform.system}.fht-share-picker;
}
