{
  description = "id3v1669 system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-colors.url = "github:misterio77/nix-colors";
    flake-utils.url = "github:numtide/flake-utils";
    nixmox.url = "github:Sorixelle/nixmox";
    sops-nix.url = "github:Mic92/sops-nix";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    eww-tray = {
     url = "github:hylophile/eww/dynamic-icons";
     flake = true;
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xdghypr = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-compat = {
      url = "github:inclyc/flake-compat";
      flake = false;
    };
  };

  outputs = { 
    self,
    nixpkgs,
    home-manager,
    hyprland,
    nur,
    nixmox,
    xdghypr,
    eww-tray,
    sops-nix,
    ... }@inputs: 
  let
    inherit (self) outputs;
    curversion = "23.11";
    mkSyst = { 
      hostname,
      envir,
      desk ? "desktop",
      bootloader ? {
        type = "systemd-boot";
        winvar = false;
        timeout = 10;
        device = "";
      },
      gpuvar ? {
        type = "nvidia";
        tech = "prime";
        busd = "PCI:01:00:0";
        busi = "PCI:00:02:0";
        port = "tbqhd";
      },
      system ? "x86_64-linux",
      cpuvar ? "intel",
      colorsvar ? "catppuccin-frappe",
      brightnesctrl ? {
        up = "ddcutil setvcp 10 + 5";
        down = "ddcutil setvcp 10 - 5";
      },
      uservars ? {
        name = "user";
        description = "id3v1669";
        domain = "none";
      },
      deflocale ? {
        kblayout = "us,ru";
        kbvariant = ",";
        kboption = "grp:win_space_toggle";
        timezone = "Australia/Perth";
        locale = "en_AU.UTF-8";
      }
    }: let 
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
      overlays = 
      [
        nur.overlay
        nixmox.overlay
        (final: prev: {
          over-swhkd = (pkgs.callPackage ./overlays/swhkd {});
          over-tlauncher = (pkgs.callPackage ./overlays/tlauncher.nix {});
          over-vesktop = (pkgs.callPackage ./overlays/vesktop {});
          over-xwalandvideobridge = (pkgs.callPackage ./overlays/xwaylandvideobridge.nix {});
          over-eww = eww-tray.packages.${pkgs.system}.default.override { withWayland = true; };
          over-hyprland = hyprland.packages.${pkgs.system}.hyprland;
          over-hypr-portal = xdghypr.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
          over-vscode = prev.vscode-fhs.overrideAttrs(oldAttrs: rec {
            name = "vscode";
            version = "1.84.0";
            src = pkgs.fetchurl {
              name = "code_x64_${version}.tar.gz";
              url = "https://update.code.visualstudio.com/${version}/linux-x64/stable";
              hash = "sha256-joaOovR16QD+W1mj9FmstizMEcEesHdpFzCSxW8DvAc=";
            };
          });
        })
      ];
    };
    in inputs.nixpkgs.lib.nixosSystem 
    {
      specialArgs = {
        inherit inputs outputs curversion uservars hostname envir deflocale pkgs cpuvar gpuvar desk system bootloader;
      };
      modules = [ 
        (./. + "/hosts/${hostname}")
        ./modules/bootloader.nix
        sops-nix.nixosModules.sops
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${uservars.name} = import (./. + "/home/home.nix") ;
            extraSpecialArgs = { inherit inputs curversion hostname envir deflocale uservars colorsvar brightnesctrl gpuvar desk; };
          };
        }
      ] ++ inputs.nixpkgs.lib.lists.optional (envir == "hypr") inputs.hyprland.nixosModules.default;
    };
  in {
    nixosConfigurations = {
      #top themes: vulcan, twilight, summercamp, stella, uwunicorn,
      #spaceduck, seti, selenized-black, rose-pine, rose-pine-moon, 
      #porple, phd, pasque, pandora, outrun-dark, mountain, material-darker,
      #lime, kimber, icy, gruvbox-dark-pale, grayscale-dark, darktooth, black-metal
      #mytop: pandora, stella, lime, gruvbox-dark-pale, outrun-dark, spaceduck, embers
      srvnet510 = mkSyst {
        hostname = "srvnet510";
        envir = "none";
        desk = "server";
        bootloader = {
          type = "grub";
          winvar = false;
          timeout = 1;
          device = "/dev/vda";
        };
        gpuvar = {
          type = "none";
        };
        uservars = {
          name = "srvnet510pq";
          description = "serverUser510";
          domain = "id3v1669.com";
        };
        deflocale = {
          kblayout = "au";
          kbvariant = "";
          kboption = "";
          timezone = "Australia/Perth";
          locale = "en_AU.UTF-8";
        };
      };
      nuc11phswaytbqhd = mkSyst {
        hostname = "nuc11ph";
        envir = "sway";
        #colorsvar = "catppuccin-frappe";
        colorsvar = "darktooth";
      };
      nuc11phhyprtbqhd = mkSyst {
        hostname = "nuc11ph";
        envir = "hypr";
        #colorsvar = "spaceduck";
        #colorsvar = "catppuccin-mocha";
        colorsvar = "catppuccin-frappe";
        #colorsvar = "darktooth";
      };
      nuc11phhyprtbfhd = mkSyst {
        hostname = "nuc11ph";
        envir = "hypr";
        #winvar = true;
        gpuvar = {
          type = "nvidia";
          tech = "prime";
          busd = "PCI:01:00:0";
          busi = "PCI:00:02:0";
          port = "tbfhd";
        };
      };
      nuc11phhyprhdmi = mkSyst {
        hostname = "nuc11ph";
        envir = "hypr";
        gpuvar = {
          type = "nvidia";
          tech = "prime";
          busd = "PCI:01:00:0";
          busi = "PCI:00:02:0";
          port = "hdmiqhd";
        };
      };
      #nuc11phgnome = mkSyst { hostname = "nuc11ph"; envir = "gnome"; };
      #nuc11phkde = mkSyst { hostname = "nuc11ph"; envir = "kde"; };
      l14g3hypr = mkSyst { 
        hostname = "l14g3";
        envir = "hypr";
        cpuvar = "amd";
        desk = "laptop";
        brightnesctrl = {
          up = "light -A 5";
          down = "light -U 5";
        };
        gpuvar = {
          type = "amd";
        };
      };
      l14g3gnome = mkSyst {
        hostname = "l14g3";
        envir = "gnome";
        cpuvar = "amd";
        desk = "laptop";
        gpuvar = {
          type = "amd";
        };
      };
      alexpchypr = mkSyst {
        hostname = "alexpc";
        envir = "hypr";
        gpuvar = {
          type = "amd";
        };
        bootloader = {
          type = "systemd-boot";
          winvar = true;
        };
        uservars = { name = "user"; description = "alexp"; };
        deflocale = {
          kblayout = "us,ru";
          kbvariant = ",";
          kboption = "grp:win_space_toggle";
          timezone = "Russia/Moscow";
          locale = "ru_RU.UTF-8";
        };
      };
    };
  };
}
