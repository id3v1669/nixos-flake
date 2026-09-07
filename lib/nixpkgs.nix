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
    inputs.ox.overlays.default
    inputs.dcgt.overlays.default
    inputs.nur.overlays.default
    inputs.cti.overlays.default
    inputs.awww.overlays.default
    inputs.iwwc.overlays.default
    inputs.ttykeyboardrs.overlays.default
    inputs.mango.overlays.default
    (import ./../overlays/uutils)
    (import ./../overlays/claude-desktop)
    (import ./../overlays/codex.nix {inherit inputs;})
    (import ./../overlays/surreal.nix)
    (import ./../overlays/xdg-desktop-portal-luminous.nix)
    (import ./../overlays/temp.nix {inherit inputs system;})
    (import ./../overlays/graphify.nix {inherit inputs system;})
    (import ./../overlays/steam.nix)
    (import ./../overlays/equibop.nix)
    (import ./../overlays/android-mic.nix)
    (import ./../overlays/android-tools.nix)
    (import ./../overlays/gruvbox-plus-icons.nix)
    (import ./../overlays/btop.nix {
      inherit cpuvar;
      inherit gpuvar;
    })
  ];
}
