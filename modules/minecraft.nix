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
        package = pkgs.fabricServers.fabric-1_21_7.override {
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
            SkinRestorer = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6734/117/skinrestorer-2.4.0%2B1.21.6-fabric.jar";
              hash = "sha256-wTcr85XaGZXf8+8lPCsdx8cXtQpwzKxh+Z29QS0dlHg=";
            };
            ScalableLux = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6694/999/ScalableLux-0.1.5%2Bfabric.e4acdcb-all.jar";
              hash = "sha256-HjpUuUjbr7yPGsCM0IfZXZOfuva7G7dS5KSiGTBhMcY=";
            };
            Sleeper = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/WTzuSu8P/versions/w4ONshdx/sleep-v4.1.4.jar";
              hash = "sha256-NzBIuRuzH5yzldE3eB+p5fv4b8mfoDq5KjKPqWo4uws=";
            };
            EasyAuth = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6701/356/easyauth-mc1.21.6-3.3.5.jar";
              hash = "sha256-UJF2d2G3ACETfEihf8+moRtuHl0vxr8Jp6WK6LAx1Ws=";
            };
            Clumps = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6728/478/Clumps-fabric-1.21.7-25.0.0.1.jar";
              hash = "sha256-fB5m22Y2VQNIwjQvwRP0Y/G2Tubylz1hObiFx9LJx7I=";
            };
            JorneyMap = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6730/472/journeymap-fabric-1.21.7-6.0.0-beta.53.jar";
              hash = "sha256-CoLJxvv1U20CmUm9kOfE3P8AJK4XduYrQLAv2Xqrsvg=";
            };
            Fabric-API = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6720/833/fabric-api-0.128.2%2B1.21.7.jar";
              hash = "sha256-YVCRbpbouYCX+k7BYhgparrE6N4Jcwfq1q2e/GfKTQ4=";
            };
            FallingTree = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6715/970/FallingTree-1.21.7-1.21.7.2.jar";
              hash = "sha256-o6cEDEZhpzgmRM7uMJLiEc+JZm2wBFnnIPDGe2IMkKY=";
            };
            Lithium = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6713/689/lithium-fabric-0.18.0%2Bmc1.21.7.jar";
              hash = "sha256-uUwXEFqZaZvikSv2LbfjT+LwJjJH1JguRAzwpmEwJqE=";
            };
            FerriteCore = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6365/997/ferritecore-8.0.0-fabric.jar";
              hash = "sha256-K5C/AMKlgIw8U5cSpVaRGR+HFtW/pu76ujXpxMWijuo=";
            };
            #C2ME = lib.cleanSource (/home + "/${uservars.name}/mods/c2me-0.3.4+alpha.0.45.jar");
            Architectury = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6673/326/architectury-17.0.6-fabric.jar";
              hash = "sha256-hehXimYp+95F8jFfn8PMP/IbPiKrKfsHoIWMUqk6k6I=";
            };
            Cloth-Config = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6669/836/cloth-config-19.0.147-fabric.jar";
              hash = "sha256-2KbcqdDa0f5EYio8agNIZBk045Q8jUJaJvESvObev6I=";
            };
            Other = lib.cleanSource (/home + "/${uservars.name}/mods");
            Krypton = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6364/768/krypton-0.2.9.jar";
              hash = "sha256-uGYia+H2DPawZQxBuxk77PMKfsN8GEUZo3F1zZ3MY6o=";
            };
          });
        };
      };
    };
  };
}
