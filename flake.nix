{
  description = "id3v1669 system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-colors.url = "github:misterio77/nix-colors";
    flake-utils.url = "github:numtide/flake-utils";
    nix-rice.url = "github:bertof/nix-rice";
    nixmox.url = "github:Sorixelle/nixmox";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    eww-tray = {
     #url = "github:ralismark/eww/tray-3";
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
    nix-rice,
    eww-tray,
    ... }@inputs: 
  let
    inherit (self) outputs;
    curversion = "23.11";
    mkSyst = { 
      hostname,
      envir,
      winvar ? false,
      desk ? "desktop",
      gpuvar ? {
        type = "nvidia";
        tech = "prime";
        busd = "PCI:01:00:0";
        busi = "PCI:00:02:0";
        port = "tbqhd";
      },
      system ? "x86_64-linux",
      cpuvar ? "intel",
      colorsvar ? "uwunicorn",
      brightnesctrl ? {
        up = "ddcutil setvcp 10 + 5";
        down = "ddcutil setvcp 10 - 5";
      },
      uservars ? {
        name = "user";
        description = "id3v1669";
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
        nix-rice.overlays.default
        (final: prev: {
          over-eww = eww-tray.packages.${pkgs.system}.default.override { withWayland = true; };
          over-hyprland = hyprland.packages.${pkgs.system}.hyprland;
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
        #(import ./scripts/flatpak.nix)
      ];
    };
    in inputs.nixpkgs.lib.nixosSystem 
    {
      specialArgs = {
        inherit inputs outputs curversion uservars hostname envir deflocale pkgs cpuvar gpuvar desk system winvar;
      };
      modules = [ 
        (./. + "/hosts/${hostname}.nix")
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
      #mytop: pandora, stella, lime, gruvbox-dark-pale, outrun-dark, spaceduck
      nuc11phhyprtbqhd = mkSyst {
        hostname = "nuc11ph";
        envir = "hypr";
        #winvar = true;
        #colorsvar = "spaceduck";
        #colorsvar = "catppuccin-mocha";
        colorsvar = "catppuccin-frappe";
      };
      nuc11phhyprtbfhd = mkSyst {
        hostname = "nuc11ph";
        envir = "hypr";
        #winvar = true;
        colorsvar = "catppuccin-frappe";
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
        winvar = false;
        colorsvar = "spaceduck";
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
        winvar = true;
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
