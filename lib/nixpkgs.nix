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
    inputs.cti.overlays.default
    inputs.awww.overlays.default
    (import ./../overlays/uutils)
    (import ./../overlays/surreal.nix)
    (import ./../overlays/temp.nix {inherit inputs system;})
    (import ./../overlays/graphify.nix {inherit inputs system;})
    (import ./../overlays/steam.nix)
    (import ./../overlays/equibop.nix)
    (import ./../overlays/android-mic.nix)
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
