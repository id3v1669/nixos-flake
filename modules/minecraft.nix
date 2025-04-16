{
  pkgs,
  lib,
  uservars,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-minecraft.nixosModules.minecraft-servers
  ];
  users.users.${uservars.name}.extraGroups = ["minecraft"];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    user = "${uservars.name}";
    servers = {
      primary = {
        enable = true;
        autoStart = false;
        package = pkgs.fabricServers.fabric-1_21_5;
        jvmOpts = "-Xmx13G";
        openFirewall = true;
        serverProperties = {
          sync-chunk-writes = false;
          server-port = 26916;
          gamemode = "survival";
          difficulty = "hard";
          max-players = 8;
          max-chained-neighbor-updates = 10000;
          simulationDistance = 8;
          view-distance = 10;
          online-mode = false;
        };
        symlinks = {
          "mods" = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
            ScalableLux = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6345/713/ScalableLux-0.1.3%2Bbeta.1%2Bfabric.4039a8d-all.jar";
              hash = "sha256-Vhu0ejRPdHvme5JlIoK5UaN0AClAfT5yv/pJhRshPN0=";
            };
            JorneyMap = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6383/895/journeymap-fabric-1.21.5-6.0.0-beta.44.jar";
              hash = "sha256-dhVpX40xYZR/Y4+pYVo1xLsZHJu6UjimKNhwETkcczU=";
            };
            Fabric-API = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6384/903/fabric-api-0.119.9%2B1.21.5.jar";
              hash = "sha256-Bo9zMisO6IKtyXsgzse4sqIvfA595bnxEyLRKJBhIqo=";
            };
            FallingTree = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6357/126/FallingTree-1.21.5-1.21.5.2.jar";
              hash = "sha256-ngmrkHSQw7rZtJUd7BGQLxLUBLvmoGSUu8JYoeaYsYM=";
            };
            Lithium = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6347/838/lithium-fabric-0.16.0%2Bmc1.21.5.jar";
              hash = "sha256-cdTy8cyb9cYTObk5iXrmHmt0FxgtpedqbkDQ9b9ZnIg=";
            };
            FerriteCore = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6365/997/ferritecore-8.0.0-fabric.jar";
              hash = "sha256-K5C/AMKlgIw8U5cSpVaRGR+HFtW/pu76ujXpxMWijuo=";
            };
            Krypton = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6364/768/krypton-0.2.9.jar";
              hash = "sha256-uGYia+H2DPawZQxBuxk77PMKfsN8GEUZo3F1zZ3MY6o=";
            };
            C2ME = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6369/961/c2me-fabric-mc1.21.5-0.3.2%2Bbeta.1.0.jar";
              hash = "sha256-NyMNlpYgh6hWQfRpD8jUKRgGHQCSAmtnHJoioM9rUjQ=";
            };
            REI = pkgs.fetchurl {
             url = "https://mediafilez.forgecdn.net/files/6414/280/RoughlyEnoughItems-19.0.806-fabric.jar";
             hash = "sha256-NDswAi1IgKTFIKOZB98m4OLWzgvbEldnVWxECOY30rc=";
            };
          });
        };
      };
    };
  };
}
