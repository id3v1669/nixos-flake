{
  description = "id3v1669 system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
      system ? "x86_64-linux",
      cpuvar ? "intel",
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
        inherit inputs outputs curversion uservars hostname envir deflocale pkgs cpuvar;
      };
      modules = [ 
        (./. + "/hosts/${hostname}.nix")
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${uservars.name} = import (./. + "/home/home.nix") ;
            extraSpecialArgs = { inherit inputs curversion hostname envir deflocale uservars; };
          };
        }
      ] ++ inputs.nixpkgs.lib.lists.optional (envir == "hypr") inputs.hyprland.nixosModules.default;
    };
  in {
    nixosConfigurations = {
      nuc11phhypr = mkSyst { hostname = "nuc11ph"; envir = "hypr"; };
      nuc11phgnome = mkSyst { hostname = "nuc11ph"; envir = "gnome"; };
      nuc11phkde = mkSyst { hostname = "nuc11ph"; envir = "kde"; };
      l14g3hypr = mkSyst { hostname = "l14g3"; envir = "hypr"; cpuvar = "amd"; };
      l14g3gnome = mkSyst { hostname = "l14g3"; envir = "gnome"; cpuvar = "amd"; };
      alexpchypr = mkSyst { hostname = "alexpch"; envir = "hypr"; };
    };
  };
}
