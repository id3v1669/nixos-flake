{ pkgs
, lib
, inputs
, ...
}:
{
  imports = [ 
    inputs.nix-minecraft.nixosModules.minecraft-servers
  ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    servers = {
      primary = {
        enable = true;
        package = pkgs.fabricServers.fabric-1_21_1;
        jvmOpts = "-Xmx6G";
        openFirewall = true;
        serverProperties = {
          server-port = 21669;
          gamemode = "survival";
          difficulty = "hard";
          max-players = 10;
          simulationDistance = 10;
          view-distance = 8;
          online-mode = false;
        };
        symlinks = {
          "mods" = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
            Fabric-API = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/gQS3JbZO/fabric-api-0.103.0+1.21.1.jar";
              sha256 = "0ki3m03bkxqsfyq8v93y8g9d29fjcndpbb7sfm28q8n0zpl2dxld";
            };
            FallingTree = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5682/903/FallingTree-1.21.1-1.21.1.2.jar";
              sha256 = "sha256-ClLu4ySdGhkZRLwsXCHnPxkh/epveh9invxanTva0SE=";
            };
            Lithium = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/5szYtenV/lithium-fabric-mc1.21.1-0.13.0.jar";
              sha256 = "sha256-ENNx/uOXvwMG4eLYY8VMVkQrzC3G4BYD8UafL+SRDWE=";  
            };
            FerriteCore = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5434/182/ferritecore-7.0.0-fabric.jar";
              sha256 = "sha256-LDEgDR9d5qPPXtxMPTkgBjbh4GDEtUjc+CSe9IdmAyM=";  
            };
            Krypton = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5460/550/krypton-0.2.8.jar"; # fix as 1.21.1 unsupported
              sha256 = "sha256-lPGVgZsk5dpk7/3J2hXN2Eg2zHXo/w/QmLq2vC9J4/4=";  
            };
            C2ME = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5680/687/c2me-fabric-mc1.21.1-0.3.0%2Balpha.0.204.jar"; # fix as alpha
              sha256 = "sha256-m+hmQj8kuY5bWsXMjIYjzDoihMNQ/OLlN9JY/ZU8vX0=";  
            };
          });
        };
      };
    };
  };
}