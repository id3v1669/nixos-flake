{ pkgs
, lib
, uservars
, inputs
, ...
}:
{
  imports = [ 
    inputs.nix-minecraft.nixosModules.minecraft-servers
  ];
  users.users.${uservars.name}.extraGroups = [ "minecraft" ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    user = "${uservars.name}";
    servers = {
      primary = {
        enable = true;
        autoStart = false;
        package = pkgs.fabricServers.fabric-1_21_4;
        jvmOpts = "-Xmx6G";
        openFirewall = true;
        serverProperties = {
          server-port = 21669;
          gamemode = "survival";
          difficulty = "hard";
          max-players = 8;
          simulationDistance = 10;
          view-distance = 10;
          online-mode = false;
        };
        symlinks = {
          "mods" = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
            Fabric-API = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6110/930/fabric-api-0.115.0%2B1.21.4.jar";
              hash = "sha256-/dsJ0snp/1Bj0WkLqJogPlfplTV839PqCzw8EdrS6KQ=";
            };
            FallingTree = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5969/318/FallingTree-1.21.4-1.21.4.2.jar";
              hash = "sha256-/KXSYx/56PibXRdd9kHOu9vPYAxs7VoFw99O/8LBPAo=";
            };
            Lithium = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6108/92/lithium-fabric-0.14.7%2Bmc1.21.4.jar";
              hash = "sha256-JdYfw/d/eY+TBnToy6xo8qAxhkpLztfVbce3P1JelGU=";  
            };
            FerriteCore = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5973/419/ferritecore-7.1.1-fabric.jar";
              hash = "sha256-DdXpIDVSAk445zoPW0aoLrZvAxiyMonGhCsmhmMnSnk=";  
            };
            Krypton = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5460/550/krypton-0.2.8.jar";
              hash = "sha256-lPGVgZsk5dpk7/3J2hXN2Eg2zHXo/w/QmLq2vC9J4/4=";  
            };
            C2ME = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6065/638/c2me-fabric-mc1.21.4-0.3.1.1.0.jar";
              hash = "sha256-eeKOKJVyKMIbd12/vRItWNMluCws7/3TikGmUwfd2/A=";  
            };
          });
        };
      };
    };
  };
}