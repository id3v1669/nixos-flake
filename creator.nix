{ inputs, outputs, curversion, usname, ... }: {
  mkSystem = { pkgs, hostname, envir}: #pkgs: hostname: envir:
      pkgs.lib.nixosSystem {
        inherit system;
        modules = [ 
          (./. + "/hosts/${hostname}/${envir}.nix")
          #nur.nixosModules.nur
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
        ] ++ pkgs.lib.lists.optional (envir == "hypr") (import ./hypr.nix { inherit hyprland; });
      };
}
