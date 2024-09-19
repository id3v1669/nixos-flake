{ inputs
, ...
}:
let
  curversion = "24.11";
in
{
  mkSyst = { 
    hostname,
    envir,
    desk ? "desktop",
    bootloader ? ({
      type = "opencore";
      defconf = true;
      timeout = 10;
      device = "nodev";
    }),
    gpuvar ? ({
      type = "nvidia";
      tech = "prime";
      busd = "PCI:01:00:0"; # lspci -nn | grep VGA
      busi = "PCI:00:02:0";
      port = "tbqhd";
    }),
    system ? "x86_64-linux",
    cpuvar ? "intel",
    colorsvar ? "gruvbox-dark",
    brightnesctrl ? ({
      up = "ddcutil setvcp 10 + 5";
      down = "ddcutil setvcp 10 - 5";
    }),
    uservars ? ({
      name = "user";
      description = "id3v1669";
      owner = "id3v1669";
      domain = "none";
      wp = "default3.png";
      sleeptimeout = 1200;
    }),
    deflocale ? ({
      kblayout = "us,ru";
      kbvariant = ",";
      kboption = "grp:win_space_toggle";
      timezone = "Australia/Perth";
      locale = "en_AU.UTF-8";
    })
  }:
  let
    stable = import inputs.nixpkgs-stable {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
    pkgs = import inputs.nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
      overlays = 
      [
        inputs.nur.overlay
        inputs.eww.overlays.default
        inputs.hyprpicker.overlays.default
        inputs.hyprlock.overlays.default
        inputs.hyprpaper.overlays.default
        inputs.hyprland-plugins.overlays.default
        inputs.nix-minecraft.overlay
        (final: prev: {
          hyprland = inputs.hyprland.packages.${prev.system}.hyprland;                                        # overlay for hyprland
          hyprland-unwrapped = inputs.hyprland.packages.${prev.system}.hyprland-unwrapped;                    # overlay for hyprland-unwrapped
          xdg-desktop-portal-hyprland = inputs.hyprland.packages.${prev.system}.xdg-desktop-portal-hyprland;  # overlay for xdg-desktop-portal-hyprland
          dynamic-color-gtk-theme = inputs.dcgt.packages.${prev.system}.default;                              # custom theme(unfinished)
          eww = inputs.eww.packages.${prev.system}.eww.override {cudaSupport = true;};   # eww overlay with nviia tempratures support
          swhkd = prev.callPackage ./../modules/swhkd-package.nix { };
          over-btop = (import ./../overlays/btop.nix { inherit pkgs gpuvar; });                               # btop overlay for gpu support
          over-logseq = (import ./../overlays/logseq.nix { inherit pkgs; });                                  # electron fix
          over-libratbag = (import ./../overlays/libratbag.nix { inherit pkgs; });                            # libratbag overlay with asus rog pugio ii config
          over-lutris = (import ./../overlays/lutris.nix { inherit pkgs; });                                  # lutris overlay with extra packages
          over-gruvbox-plus-icons = (import ./../overlays/gruvbox-plus-icons.nix { inherit pkgs; });          # gruvbox-plus-icons overlay with symlinks for symbolic icons
          over-steam = (import ./../overlays/steam.nix { inherit pkgs; });                                    # steam overlay with extra packages
          over-vesktop = (import ./../overlays/vesktop.nix { inherit pkgs gpuvar; });                         # vesktop overlay with no wayland flags
          over-firefox = (import ./../overlays/firefox.nix { inherit pkgs; });                                # temp bump due to isses on hyprland
          over-rofi-calc = (import ./../overlays/rofi-calc.nix { inherit pkgs; });                            # rofi-calc overlay as package has non-wayland build input
          over-rofi-emoji = (import ./../overlays/rofi-emoji.nix { inherit pkgs; });                          # rofi-emoji overlay as package has non-wayland build input
          over-opencore = (prev.callPackage ./../overlays/opencore.nix {});                                   # opencore bootloader files as official repo doesn't have it (later create module)
          over-veracrypt = (prev.callPackage ./../overlays/veracrypt {});                                     # veracrypt overlay due to sudo-rs glitch
          over-spotify = (prev.callPackage ./../overlays/spot.nix {});                                        # spotify with adblocker
          #--------------------------------------------------------------------------------------
        })
      ];
    };
  in
  inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit curversion uservars hostname envir deflocale pkgs stable cpuvar gpuvar desk system bootloader brightnesctrl inputs colorsvar;
    };
    modules = [
      (./.. + "/hosts/${hostname}")
      inputs.swhkd.nixosModules.default
      inputs.sops-nix.nixosModules.sops
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.${uservars.name} = import (./.. + "/home/home.nix") ;
          extraSpecialArgs = { inherit curversion hostname envir deflocale uservars colorsvar gpuvar cpuvar desk inputs stable; };
        };
      }
    ];
  };
}
