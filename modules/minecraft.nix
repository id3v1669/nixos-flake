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
        package = pkgs.fabricServers.fabric-1_21_8.override {
          jre_headless = pkgs.zulu;
        };
        jvmOpts = lib.concatStringsSep " " [
          "-Xms12G"
          "-Xmx12G"
          "-XX:+UseG1GC"
          "-XX:+ParallelRefProcEnabled"
          "-XX:MaxGCPauseMillis=200"
          "-XX:+UnlockExperimentalVMOptions"
          "-XX:+DisableExplicitGC"
          "-XX:+AlwaysPreTouch"
          "-XX:G1NewSizePercent=30"
          "-XX:G1MaxNewSizePercent=40"
          "-XX:G1HeapRegionSize=8M"
          "-XX:G1ReservePercent=20"
          "-XX:G1HeapWastePercent=5"
          "-XX:G1MixedGCCountTarget=4"
          "-XX:InitiatingHeapOccupancyPercent=15"
          "-XX:G1MixedGCLiveThresholdPercent=90"
          "-XX:G1RSetUpdatingPauseTimePercent=5"
          "-XX:SurvivorRatio=32"
          "-XX:+PerfDisableSharedMem"
          "-XX:MaxTenuringThreshold=1"
        ];
        openFirewall = true;
        serverProperties = {
          sync-chunk-writes = false;
          server-port = 26917;
          gamemode = "survival";
          difficulty = "hard";
          max-players = 8;
          max-chained-neighbor-updates = 10000;
          simulationDistance = 8;
          view-distance = 10;
          online-mode = false;
          allow-flight = true;
        };
        symlinks = {
          "mods" = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
            SkinRestorer = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6897/77/skinrestorer-2.4.3%2B1.21.6-fabric.jar";
              hash = "sha256-a1KsNKP6QlAkr1kuJOIia4yPPGfkYznyo6Scxc+4BiY=";
            };
            ScalableLux = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6694/999/ScalableLux-0.1.5%2Bfabric.e4acdcb-all.jar";
              hash = "sha256-HjpUuUjbr7yPGsCM0IfZXZOfuva7G7dS5KSiGTBhMcY=";
            };
            Sleeper = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/WTzuSu8P/versions/zIrLsHqN/sleep-v4.1.5.jar";
              hash = "sha256-r3rJJgJOyiRaG+FVFhjf1veRXCkrjIDlYoVi2vxm4lU=";
            };
            EasyAuth = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6908/895/easyauth-mc1.21.6-3.3.6.jar";
              hash = "sha256-rwjzgmaHe4L2ooHLcsMncLNuRu7tEC80rr3oxzcNI0Q=";
            };
            Clumps = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6805/185/Clumps-fabric-1.21.8-26.0.0.1.jar";
              hash = "sha256-vuTtxMHU5EaKup3lb3BiVmDmmW1k2nx5swj9oxjTWFA=";
            };
            JorneyMap = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6730/472/journeymap-fabric-1.21.7-6.0.0-beta.53.jar";
              hash = "sha256-CoLJxvv1U20CmUm9kOfE3P8AJK4XduYrQLAv2Xqrsvg=";
            };
            Fabric-API = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6972/705/fabric-api-0.133.4%2B1.21.8.jar";
              hash = "sha256-aG8XESXoFNxYC6amH2Hs3oUamBcw5Dtwjwdz1iNWwJk=";
            };
            FallingTree = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6973/682/FallingTree-1.21.8-1.21.8.3.jar";
              hash = "sha256-0/noEJwJAFw2G84/pt9Sq9O9OKGydhF/xsHsBNKY5QY=";
            };
            Lithium = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6779/976/lithium-fabric-0.18.0%2Bmc1.21.8.jar";
              hash = "sha256-kBPy+N/t6v20OBddTHZvW0E95WLc0RlaUAIwxVFxeH4=";
            };
            FerriteCore = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6365/997/ferritecore-8.0.0-fabric.jar";
              hash = "sha256-K5C/AMKlgIw8U5cSpVaRGR+HFtW/pu76ujXpxMWijuo=";
            };
            C2ME = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6825/631/c2me-fabric-mc1.21.8-0.3.4.0.0.jar";
              hash = "sha256-MkYZOI9AL7yswqEfSp8/Njs4z7xFRItuvLu96znO/v4=";
            };
            Architectury = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6803/290/architectury-17.0.8-fabric.jar";
              hash = "sha256-tdBR+O/+j5R2+TdeEeSN+vuCF5FDW4/jaIaZADl/BdU=";
            };
            Cloth-Config = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6669/836/cloth-config-19.0.147-fabric.jar";
              hash = "sha256-2KbcqdDa0f5EYio8agNIZBk045Q8jUJaJvESvObev6I=";
            };
            Krypton = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6364/768/krypton-0.2.9.jar";
              hash = "sha256-uGYia+H2DPawZQxBuxk77PMKfsN8GEUZo3F1zZ3MY6o=";
            };
            REI = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6833/148/RoughlyEnoughItems-20.0.811-fabric.jar";
              hash = "sha256-e2t1DkKcRCCF+gdFsDwnOyQiTxzngF2DnrUqmfKwJTo=";
            };
            Anvil = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/LrtCyjyV/versions/5GBPmaGe/too-expensive-removed-v1.2.3.jar";
              hash = "sha256-wvBwS1VjpQ+iRqQA+eV49P569n7jqmTrXQXalQfrdjw=";
            };
          });
        };
      };
    };
  };
}
