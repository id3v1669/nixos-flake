{
  description = "id3v1669 system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    eww-tray = {
      url = "github:ralismark/eww/tray-3";
      flake = true;
    };
    nix-colors.url = "github:misterio77/nix-colors";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs"; 
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
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
    ... }@inputs: 
  let
    inherit (self) outputs;
    curversion = "23.11";
    mkSyst = { 
      hostname,
      envir,
      tempvar,
      winvar ? false,
      desk ? "desktop",
      gpuvar ? "nvidiaprime",
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
      overlays = [
        #inputs.nur.nixosModules.nur
      ];
    };
    in inputs.nixpkgs.lib.nixosSystem 
    {
      specialArgs = {
        inherit inputs outputs curversion uservars hostname envir deflocale pkgs cpuvar gpuvar desk system winvar tempvar;
      };
      modules = [ 
        (./. + "/hosts/${hostname}.nix")
        
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${uservars.name} = import (./. + "/home/home.nix") ;
            extraSpecialArgs = { inherit inputs curversion hostname envir deflocale uservars tempvar colorsvar brightnesctrl; };
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
      #mytop: pandora, stella, lime, gruvbox-dark-pale
      nuc11phhypr = mkSyst { hostname = "nuc11ph"; envir = "hypr"; winvar = true; colorsvar = "uwunicorn"; tempvar = "/home/user/myrepos/nixos-flake"; };
      nuc11phgnome = mkSyst { hostname = "nuc11ph"; envir = "gnome"; };
      nuc11phkde = mkSyst { hostname = "nuc11ph"; envir = "kde"; };
      l14g3hypr = mkSyst { 
        hostname = "l14g3";
        envir = "hypr";
        cpuvar = "amd";
        desk = "laptop";
        gpuvar = "amd";
        tempvar = "/home/user/nixos-flake"; 
        brightnesctrl = {
          up = "light -A 5";
          down = "light -U 5";
        };
      };
      l14g3gnome = mkSyst { hostname = "l14g3"; envir = "gnome"; cpuvar = "amd"; desk = "laptop"; gpuvar = "amd"; };
      alexpchypr = mkSyst {
        hostname = "alexpc";
        envir = "hypr";
        gpuvar = "amd";
        winvar = true;
        uservars = { name = "user"; description = "alexp"; };
        tempvar = "/home/user/nixos-flake";
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
