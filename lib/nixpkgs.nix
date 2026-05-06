{
  inputs,
  allSpecialArgs,
  ...
}:
with allSpecialArgs; {
  inherit system;
  config.allowUnfree = true;
  overlays = [
    inputs.claude-code.overlays.default
    inputs.prism-launcher.overlays.default
    inputs.nur.overlays.default
    inputs.eww.overlays.default
    inputs.nix-minecraft.overlay
    inputs.cti.overlays.default
    inputs.awww.overlays.default
    (import ./../overlays/uutils)
    (import ./../overlays/temp.nix)
    (import ./../overlays/steam.nix)
    (import ./../overlays/equibop.nix)
    (import ./../overlays/lutris.nix)
    (import ./../overlays/gruvbox-plus-icons.nix)
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
