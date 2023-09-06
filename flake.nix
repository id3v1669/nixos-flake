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

  outputs = { self, nixpkgs, home-manager, hyprland, nur, ... }@inputs: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };     
    };
    mkSystem = pkgs: system: hostname: envir:
      pkgs.lib.nixosSystem {
        inherit system;
        modules = [ 
          (./. + "/hosts/${hostname}/${envir}.nix")
          (import ./hypr-module.nix { inherit hyprland; })
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.user = import (./. + "/home/home${hostname}${envir}.nix") ;
              extraSpecialArgs = { inherit inputs; };
            };
            nixpkgs.overlays = [
              nur.overlay
            ];
          }
        ];
      };
  in {
    nixosConfigurations = {
      nuc11phhypr = mkSystem inputs.nixpkgs system "nuc11ph" "hypr";
      nuc11phgnome = mkSystem inputs.nixpkgs system "nuc11ph" "gnome";
      nuc11phkde = mkSystem inputs.nixpkgs system "nuc11ph" "kde";
      l14g3hypr = mkSystem inputs.nixpkgs system "l14g3" "hypr";
      l14g3gnome = mkSystem inputs.nixpkgs system "l14g3" "gnome";
      alexpchypr = mkSystem inputs.nixpkgs system "alexpc" "hypr";
    };
  };
}
