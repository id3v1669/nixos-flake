{inputs, ...}: final: pkgs: {
  fht-compositor = inputs.fht-compositor.packages.${pkgs.system}.fht-compositor;
  #fht-compositor = inputs.fht-compositor.packages.${pkgs.system}.fht-compositor-debug;
  fht-share-picker = inputs.fht-share-picker.packages.${pkgs.system}.fht-share-picker;
}
