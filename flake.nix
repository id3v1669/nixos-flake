{
  description = "id3v1669 system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stable-nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nix-colors.url = "github:misterio77/nix-colors";
    flake-utils.url = "github:numtide/flake-utils";
    nixmox.url = "github:Sorixelle/nixmox";
    sops-nix.url = "github:Mic92/sops-nix";
    nixified-ai.url = "github:nixified-ai/flake";
    prism-launcher.url = "github:PrismLauncher/PrismLauncher";
    nur.url = "github:nix-community/NUR";
    eww = {
     url = "github:id3v1669/eww";
     flake = true;
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ndct-sddm = {
     url = "github:id3v1669/ndct-sddm-corners";
     inputs.nixpkgs.follows = "nixpkgs";
    };
    swhkd = {
      url = "github:id3v1669/swhkd";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-compat = {
      url = "github:inclyc/flake-compat";
      flake = false;
    };
    #hyprland.url = "github:hyprwm/Hyprland/v0.41.1?submodules=1";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    xdghypr = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprlock = {
      url = "github:hyprwm/hyprlock";
    };
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { 
  self
, nixpkgs
, stable-nixpkgs
, home-manager
, hyprland
, nur
, nixmox
, xdghypr
, hyprlock
, eww
, sops-nix
, nix-colors
, nixified-ai
, prism-launcher
, ndct-sddm
, swhkd
, hyprpicker
, auto-cpufreq
, ... }@inputs: 
  let
    inherit (self) outputs;
    curversion = "24.11";
    mkSyst = { 
      hostname,
      envir,
      desk ? "desktop",
      bootloader ? {
        type = "opencore";
        defconf = true;
        timeout = 10;
        device = "nodev";
      },
      gpuvar ? {
        type = "nvidia";
        tech = "prime";
        busd = "PCI:01:00:0"; # lspci -nn | grep VGA
        busi = "PCI:00:02:0";
        port = "tbqhd";
      },
      system ? "x86_64-linux",
      cpuvar ? "intel",
      colorsvar ? "gruvbox-dark-pale",
      brightnesctrl ? {
        up = "ddcutil setvcp 10 + 5";
        down = "ddcutil setvcp 10 - 5";
      },
      uservars ? {
        name = "user";
        description = "id3v1669";
        owner = "id3v1669";
        domain = "none";
        wp = "default3.png";
        sleeptimeout = 1200;
      },
      deflocale ? {
        kblayout = "us,ru";
        kbvariant = ",";
        kboption = "grp:win_space_toggle";
        timezone = "Australia/Perth";
        locale = "en_AU.UTF-8";
      }
    }: let
    stable-pkgs = import stable-nixpkgs {
     inherit system;
     config = {
       allowUnfree = true;
     };
    };
    pkgs = import nixpkgs {
      inherit system;
      config = {
        cudaSupport = (gpuvar.type == "nvidia");
        allowUnfree = true;
      };
      overlays = 
      [
        nur.overlay
        nixmox.overlay
        prism-launcher.overlays.default
        (final: prev: {
          over-intel-vaapi-driver = prev.vaapiIntel.override { enableHybridCodec = true; };     # intel vaapi driver with hybrid codec support
          #over-swhkd = swhkd.packages.${prev.system}.swhkd;                                     # hotkey daemon
          over-eww = eww.packages.${prev.system}.default;                                       # eww custom - swap tray mouse buttons
          over-hyprland = hyprland.packages.${prev.system}.hyprland;                            # hyprland overlay
          over-hypr-portal = xdghypr.packages.${prev.system}.xdg-desktop-portal-hyprland;       # hyprland portal overlay
          over-hyprlock = hyprlock.packages.${prev.system}.hyprlock;                            # hyprlock overlay
          over-hyprpicker = hyprpicker.packages.${prev.system}.hyprpicker;                      # hyprpicker overlay
          over-ndct-sddm = ndct-sddm.packages.${prev.system}.ndct-sddm-corners;                 # sddm theme
          over-lutris = (import ./overlays/lutris.nix { inherit pkgs; });                       # lutris overlay with extra packages
          over-steam = (import ./overlays/steam.nix { inherit pkgs; });                         # steam overlay with extra packages
          over-rofi-calc = (import ./overlays/rofi-calc.nix { inherit pkgs; });                 # rofi-calc overlay as package has non-wayland build input
          over-rofi-emoji = (import ./overlays/rofi-emoji.nix { inherit pkgs; });               # rofi-emoji overlay as package has non-wayland build input
          over-prismlauncher = (import ./overlays/prismlauncher.nix { inherit pkgs; });         # minecraft launcher with java replacement
          over-opencore = (prev.callPackage ./overlays/opencore.nix {});                        # opencore bootloader files as official repo doesn't have it (later create module)
          over-veracrypt = (prev.callPackage ./overlays/veracrypt {});                          # veracrypt overlay due to sudo-rs glitch
          over-outline-manager = (prev.callPackage ./overlays/outline-manager.nix {});          # outline-manager as official repo doesn't have it
          over-spotify = (prev.callPackage ./overlays/spot.nix {});                             # spotify with adblocker
          over-soundux = (prev.callPackage ./overlays/soundux {});                              # soundux as official package is broken
          #-------------------------------------------------------------------------------------ai cuda stuff
          over-fooocus = (prev.callPackage ./overlays/fooocus {});                              # fooocus ai: still broken paths need to be fixed
          over-accelerate = (import ./overlays/accelerate.nix { inherit pkgs; });               # with cuda torch
          over-pytorch-lightning = (import ./overlays/pytorch-lightning.nix { inherit pkgs; }); # with cuda torch
          over-torchsde = (import ./overlays/torchsde.nix { inherit pkgs; });                   # with cuda torch
          over-torchvision = (import ./overlays/torchvision.nix { inherit pkgs; });             # with cuda torch
          over-torchgpipe = (import ./overlays/torchgpipe.nix { inherit pkgs; });               # with cuda torch
          over-ptml = (import ./overlays/pytorch-metric-learning.nix { inherit pkgs; });        # with cuda torch and fix for broken tests
          over-bitsandbytes = (import ./overlays/bitsandbytes.nix { inherit pkgs; });           # with cuda torch
          over-timm = (import ./overlays/timm.nix { inherit pkgs; });                           # with cuda torch
          over-opencv4 = (import ./overlays/opencv4.nix { inherit pkgs; });                     # with cuda
          #--------------------------------------------------------------------------------------
        })
      ];
    };
    in nixpkgs.lib.nixosSystem 
    {
      specialArgs = {
        inherit outputs curversion uservars hostname envir deflocale pkgs cpuvar gpuvar desk system bootloader nixified-ai brightnesctrl;
      };
      modules = [
        (./. + "/hosts/${hostname}")
        swhkd.nixosModules.default
        auto-cpufreq.nixosModules.default
        sops-nix.nixosModules.sops
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${uservars.name} = import (./. + "/home/home.nix") ;
            extraSpecialArgs = { inherit curversion hostname envir deflocale uservars colorsvar gpuvar cpuvar desk sops-nix nix-colors; };
          };
        }
      ] ++ nixpkgs.lib.lists.optional (envir == "Hyprland") hyprland.nixosModules.default;
    };
  in {
    nixosConfigurations = {
      i511n3080hypr = mkSyst { 
        hostname = "i511n3080";
        envir = "Hyprland";
        uservars = {
          name = "user";
          description = "id3v1669";
          domain = "none";
          wp = "default3.png";
          owner = "id3v1669";
          sleeptimeout = 99000;
        };
        bootloader = {
          type = "systemd";
          timeout = 10;
        };
        gpuvar = {
          type = "nvidia";
          tech = "native";
          port = "hdmi";
        };
      };
      nuc10chhypr = mkSyst { 
        hostname = "nuc10ch";
        envir = "Hyprland";
        cpuvar = "intel";
        bootloader = {
          type = "systemd";
          defconf = false;
          timeout = 10;
        };
        uservars = {
          name = "user";
          description = "id3v1669";
          domain = "none";
          wp = "default3.png";
          owner = "id3v1669";
          sleeptimeout = 1200;
        };
        brightnesctrl = {
          up = "light -A 5";
          down = "light -U 5";
        };
        gpuvar = {
          type = "amd";
          tech = "amd";
        };
      };
      nuc11phplasma5tb = mkSyst {
        hostname = "nuc11ph";
        envir = "plasma5";
        uservars = {
          name = "user";
          description = "id3v1669";
          domain = "none";
          wp = "default3.png";
          owner = "id3v1669";
          sleeptimeout = 99000;
        };
        bootloader = {
          type = "systemd";
          timeout = 10;
        };
      };
      nuc11phhyprtb = mkSyst {
        hostname = "nuc11ph";
        envir = "Hyprland";
        uservars = {
          name = "user";
          description = "id3v1669";
          domain = "none";
          wp = "default3.png";
          owner = "id3v1669";
          sleeptimeout = 99000;
        };
        bootloader = {
          type = "systemd";
          timeout = 10;
        };
        gpuvar = {
          type = "nvidia";
          tech = "prime";
          busd = "PCI:01:00:0";
          busi = "PCI:00:02:0";
          port = "tbqhd";
        };
      };
      nuc11phswayhdmi = mkSyst {
        hostname = "nuc11ph";
        envir = "sway";
        uservars = {
          name = "user";
          description = "id3v1669";
          domain = "none";
          wp = "default3.png";
          owner = "id3v1669";
          sleeptimeout = 99000;
        };
        bootloader = {
          type = "systemd";
          timeout = 10;
        };
        gpuvar = {
          type = "nvidia";
          tech = "native";
          port = "hdmi";
        };
      };
      nuc11phhyprhdmi = mkSyst {
        hostname = "nuc11ph";
        envir = "Hyprland";
        uservars = {
          name = "user";
          description = "id3v1669";
          domain = "none";
          wp = "default3.png";
          owner = "id3v1669";
          sleeptimeout = 99000;
        };
        bootloader = {
          type = "systemd";
          timeout = 10;
        };
        gpuvar = {
          type = "nvidia";
          tech = "native";
          port = "hdmi";
        };
      };
      nuc11phhyprhdminvk = mkSyst {
        hostname = "nuc11ph";
        envir = "Hyprland";
        uservars = {
          name = "user";
          description = "id3v1669";
          domain = "none";
          wp = "default3.png";
          owner = "id3v1669";
          sleeptimeout = 99000;
        };
        bootloader = {
          type = "systemd";
          timeout = 10;
        };
        gpuvar = {
          type = "nvidia";
          tech = "nvk";
          port = "hdmiqhd";
        };
      };
      l14g3hypr = mkSyst { 
        hostname = "l14g3";
        envir = "Hyprland";
        cpuvar = "amd";
        desk = "laptop";
        bootloader = {
          type = "systemd";
          defconf = false;
          timeout = 10;
        };
        uservars = {
          name = "user";
          description = "id3v1669";
          domain = "none";
          wp = "default3.png";
          owner = "id3v1669";
          sleeptimeout = 1200;
        };
        brightnesctrl = {
          up = "light -A 5";
          down = "light -U 5";
        };
        gpuvar = {
          type = "amd";
          tech = "amd";
        };
      };
      srvnet510 = mkSyst {
        hostname = "srvnet510";
        envir = "none";
        desk = "server";
        bootloader = {
          type = "grub";
          timeout = 1;
          device = "/dev/vda";
        };
        gpuvar = {
          type = "none";
          tech = "none";
        };
        uservars = {
          name = "srvnet510pq";
          description = "serverUser510";
          domain = "id3v1669.com";
          owner = "id3v1669";
        };
        deflocale = {
          kblayout = "au";
          kbvariant = "";
          kboption = "";
          timezone = "Australia/Perth";
          locale = "en_AU.UTF-8";
        };
      };
    };
  };
}
