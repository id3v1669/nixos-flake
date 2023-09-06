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
    curversion = "23.05";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };     
    };
    mkSyst = { 
      hostname,
      envir,
      usname ? "user",
      kblayout ? "us,ru",
      kbvariant ? ",",
      kboption ? "grp:win_space_toggle"
    }: inputs.nixpkgs.lib.nixosSystem 
    {
      specialArgs = {
        inherit system inputs outputs curversion usname hostname envir kblayout;
      };
      modules = [ 
        (./. + "/hosts/${hostname}/${envir}.nix")
        #nur.nixosModules.nur
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.user = import (./. + "/home/home${hostname}${envir}.nix") ;
            extraSpecialArgs = { inherit usname inputs; };
          };
          nixpkgs.overlays = [
            inputs.nur.overlay
          ];
        }
      ] ++ inputs.nixpkgs.lib.lists.optional (envir == "hypr") (import ./hypr.nix { inherit inputs; });
    };
  in {
    nixosConfigurations = {
      nuc11phhypr = mkSyst { hostname = "nuc11ph"; envir = "hypr"; };
      nuc11phgnome = mkSyst { hostname = "nuc11ph"; envir = "gnome"; };
      nuc11phkde = mkSyst { hostname = "nuc11ph"; envir = "kde"; };
      l14g3hypr = mkSyst { hostname = "l14g3"; envir = "hypr"; };
      l14g3gnome = mkSyst { hostname = "l14g3"; envir = "gnome"; };
      alexpchypr = mkSyst { hostname = "alexpch"; envir = "hypr"; };
    };
  };
}
#   let
#     #myvars = {
#     usname = "user";
#     system = "x86_64-linux";
#     pkgs = import nixpkgs {
#       inherit system;
#       config = {
#         allowUnfree = true;
#       };     
#     };
#     mkSystem = pkgs: hostname: envir:
#       pkgs.lib.nixosSystem {
#         inherit system;
#         modules = [ 
#           (./. + "/hosts/${hostname}/${envir}.nix")
#           #nur.nixosModules.nur
#           home-manager.nixosModules.home-manager
#           {
#             home-manager = {
#               useGlobalPkgs = true;
#               useUserPackages = true;
#               users.user = import (./. + "/home/home${hostname}${envir}.nix") ;
#               extraSpecialArgs = { inherit inputs; };
#             };
#             nixpkgs.overlays = [
#               nur.overlay
#             ];
#           }
#         ] ++ pkgs.lib.lists.optional (envir == "hypr") (import ./hypr.nix { inherit hyprland; });
#       };
#   in {
#     nixosConfigurations = {
#       nuc11phhypr = mkSystem inputs.nixpkgs "nuc11ph" "hypr";
#       nuc11phgnome = mkSystem inputs.nixpkgs "nuc11ph" "gnome";
#       nuc11phkde = mkSystem inputs.nixpkgs "nuc11ph" "kde";
#       l14g3hypr = mkSystem inputs.nixpkgs "l14g3" "hypr";
#       l14g3gnome = mkSystem inputs.nixpkgs "l14g3" "gnome";
#       alexpchypr = mkSystem inputs.nixpkgs "alexpc" "hypr";
      
#     };
#   };
# }
