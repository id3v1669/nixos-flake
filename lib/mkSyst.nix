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
    colorsvar ? "gruvbox-dark-pale",
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
    pkgs = import inputs.nixpkgs {
      inherit system;
      config = {
        cudaSupport = (gpuvar.type == "nvidia");
        allowUnfree = true;
      };
      overlays = 
      [
        inputs.nur.overlay
        inputs.prism-launcher.overlays.default
        inputs.eww.overlays.default
        inputs.xdghypr.overlays.default
        inputs.hyprpicker.overlays.default
        inputs.hyprlock.overlays.default
        inputs.hyprpaper.overlays.default
        inputs.hypridle.overlays.default
        (final: prev: {
          hyprland = inputs.hyprland.packages.${prev.system}.hyprland;                             # overlay for hyprland(overlays.default is broken 20240801)
          dynamic-color-gtk-theme = inputs.dcgt.packages.${prev.system}.default;                   # custom theme(unfinished)
          over-ndct-sddm = inputs.ndct-sddm.packages.${prev.system}.ndct-sddm-corners;             # sddm theme
          over-libratbag = (import ./../overlays/libratbag.nix { inherit pkgs; });                 # libratbag overlay with asus rog pugio ii config
          over-lutris = (import ./../overlays/lutris.nix { inherit pkgs; });                       # lutris overlay with extra packages
          over-steam = (import ./../overlays/steam.nix { inherit pkgs; });                         # steam overlay with extra packages
          over-firefox = (import ./../overlays/firefox.nix { inherit pkgs; });                     # ff
          over-rofi-calc = (import ./../overlays/rofi-calc.nix { inherit pkgs; });                 # rofi-calc overlay as package has non-wayland build input
          over-rofi-emoji = (import ./../overlays/rofi-emoji.nix { inherit pkgs; });               # rofi-emoji overlay as package has non-wayland build input
          over-opencore = (prev.callPackage ./../overlays/opencore.nix {});                        # opencore bootloader files as official repo doesn't have it (later create module)
          over-veracrypt = (prev.callPackage ./../overlays/veracrypt {});                          # veracrypt overlay due to sudo-rs glitch
          over-spotify = (prev.callPackage ./../overlays/spot.nix {});                             # spotify with adblocker
          #--------------------------------------------------------------------------------------
        })
      ];
    };
  in
  inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit curversion uservars hostname envir deflocale pkgs cpuvar gpuvar desk system bootloader brightnesctrl inputs;
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
          extraSpecialArgs = { inherit curversion hostname envir deflocale uservars colorsvar gpuvar cpuvar desk inputs; };
        };
      }
    ];
  };
}
