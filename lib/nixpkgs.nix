{
  inputs,
  allSpecialArgs,
  ...
}:
with allSpecialArgs; {
  inherit system;
  config.allowUnfree = true;
  overlays = [
    inputs.aplin.overlays.default
    inputs.prism-launcher.overlays.default
    inputs.nur.overlays.default
    inputs.eww.overlays.default
    inputs.nix-minecraft.overlay
    (import ./../overlays/fht-compositor.nix {
      inherit inputs;
    })
    (import ./../overlays/millennium.nix)
    (import ./../overlays/steam.nix)
    (import ./../overlays/equibop.nix)
    (import ./../overlays/lutris.nix)
    (import ./../overlays/gruvbox-plus-icons.nix)
    (import ./../overlays/spotify.nix)
    (import ./../overlays/btop.nix {
      inherit cpuvar;
      inherit gpuvar;
    })
    (import ./../overlays/eww.nix {
      inherit gpuvar;
      inherit inputs;
    })
  ];
}
