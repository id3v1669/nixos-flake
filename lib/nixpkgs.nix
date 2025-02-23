{ inputs
, allSpecialArgs
, ...
}:
with allSpecialArgs; {
  inherit system;
  config.allowUnfreePredicate = pkg: builtins.elem (inputs.nixpkgs.lib.getName pkg) [
    "vscode"
    "vscode-extension-github-copilot"
    "rar"
    "spotify"
    "steam"
    "steam-unwrapped"
    "veracrypt"
    "wpscan"
    "discord"
    "volatility3"
    "teamspeak6-client"
    "minecraft-server"
    "corefonts"
  ];
  overlays = 
  [
    inputs.prism-launcher.overlays.default
    inputs.nur.overlays.default
    inputs.eww.overlays.default
    inputs.nix-minecraft.overlay
    (import ./../overlays/openlinkhub.nix)
    (import ./../overlays/steam.nix)
    (import ./../overlays/equibop.nix)
    (import ./../overlays/libratbag.nix)
    (import ./../overlays/lutris.nix)
    (import ./../overlays/gruvbox-plus-icons.nix)
    (import ./../overlays/btop.nix {cpuvar = cpuvar; gpuvar = gpuvar;})
    (import ./../overlays/eww.nix {gpuvar = gpuvar; inputs = inputs;})
    (import ./../overlays/ts6.nix)
    (final: pkgs: {
      cxxopts = stable.cxxopts;
    })
  ];
}
