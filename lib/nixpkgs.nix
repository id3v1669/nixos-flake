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
    "volatility3"
  ];
  overlays = 
  [
    inputs.nur.overlays.default
    inputs.eww.overlays.default
    inputs.hyprpicker.overlays.default
    inputs.nix-minecraft.overlay
    inputs.hyprland.overlays.default
    (final: pkgs: {
      dynamic-color-gtk-theme = inputs.dcgt.packages.${pkgs.system}.default;                              # custom theme(unfinished)
      eww = inputs.eww.packages.${pkgs.system}.eww.override {cudaSupport = (gpuvar.type == "nvidia" && gpuvar.tech != "nvk");}; 
                                                                                                          # eww overlay with nviia tempratures support
      over-btop = (import ./../overlays/btop.nix { inherit pkgs gpuvar cpuvar; });                        # btop overlay for gpu support
      over-libratbag = (import ./../overlays/libratbag.nix { inherit pkgs; });                            # libratbag overlay with asus rog pugio ii config
      over-lutris = (import ./../overlays/lutris.nix { inherit pkgs; });                                  # lutris overlay with extra packages
      over-gruvbox-plus-icons = (import ./../overlays/gruvbox-plus-icons.nix { inherit pkgs; });          # gruvbox-plus-icons overlay with symlinks for symbolic icons
      over-steam = (import ./../overlays/steam.nix { inherit pkgs; });                                    # steam overlay with extra packages
      over-equibop = (import ./../overlays/equibop.nix { inherit pkgs; });                                # equibob overlay
      over-rofi-calc = (import ./../overlays/rofi-calc.nix { inherit pkgs; });                            # rofi-calc overlay as package has non-wayland build input
      over-rofi-emoji = (import ./../overlays/rofi-emoji.nix { inherit pkgs; });                          # rofi-emoji overlay as package has non-wayland build input
      over-opencore = (pkgs.callPackage ./../overlays/opencore.nix {});                                   # opencore bootloader files as official repo doesn't have it (later create module)
      #--------------------------------------------------------------------------------------
    })
  ];
}