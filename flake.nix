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

  outputs = { self, nixpkgs, home-manager, hyprland, nur, ... }: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };     
    };
  in {
    nixosConfigurations = {
      nuc11phhypr = nixpkgs.lib.nixosSystem rec {
        inherit system;
        specialArgs = { inherit hyprland; };
        modules = [ 
          ./hosts/nuc11ph/hyprland.nix
          hyprland.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.user = import ./home/homenuc11phhypr.nix ;
            home-manager.extraSpecialArgs = specialArgs;
          }
        ];
      };
      nuc11phkde = nixpkgs.lib.nixosSystem rec {
        inherit system;
        modules = [ 
          ./hosts/nuc11ph/kde.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.user = import ./home/homenuc11phkde.nix ;
          }
        ];
      };
      nuc11phgnome = nixpkgs.lib.nixosSystem rec {
        inherit system;
        modules = [ 
          ./hosts/nuc11ph/gnome.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.user = import ./home/homenuc11phgnome.nix ;
          }
        ];
      };
      l14g3hypr = nixpkgs.lib.nixosSystem rec {
        inherit system;
        specialArgs = { inherit hyprland; };
        modules = [ 
          ./hosts/l14g3/hyprland.nix
          hyprland.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.user = import ./home/homel14g3hypr.nix ;
            home-manager.extraSpecialArgs = specialArgs;
          }
        ];
      };
      l14g3gnome = nixpkgs.lib.nixosSystem rec {
        inherit system;
        modules = [ 
          ./hosts/l14g3/gnome.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.user = import ./home/homel14g3gnome.nix ;
          }
        ];
      };
      alexpchypr = nixpkgs.lib.nixosSystem rec {
        inherit system;
        specialArgs = { inherit hyprland; };
        modules = [ 
          ./hosts/alexpc/hyprland.nix
          hyprland.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.user = import ./home/homealexpchypr.nix ;
            home-manager.extraSpecialArgs = specialArgs;
          }
        ];
      };
    };
  };
}
