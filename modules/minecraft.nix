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
      master = {
        enable = true;
        autoStart = false;
        package = pkgs.fabricServers.fabric-1_21_11.override {
          jre_headless = pkgs.zulu;
        };
        operators = {
          id3v1669 = {
            uuid = "adfca07e-7c7a-3565-b70f-831f2bb095fd";
            level = 4;
    				bypassesPlayerLimit = true;
          };
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
          spawn-protection = 0;
        };
        symlinks = {
          "mods" = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
            tt20 = pkgs.fetchurl {
             url = "https://cdn.modrinth.com/data/YS3ZignI/versions/rnlrw482/tt20-0.8.0%2Bmc1.21.11-fabric.jar";
             hash = "sha256-sjl//IUe2b8hTnYGAH594qL+diKXaedkHuRTdxirSSc=";
            };
            Terralith = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/8oi3bsk5/versions/TFW9ZxPQ/Terralith_1.21.x_v2.5.14.jar";
              hash = "sha256-3mLFiOb5f+KgkjyQVBuRYv7MoPX9h6uusJpevlQg238=";
            };
            Crafts = pkgs.fetchurl {
              url = "https://id3v1669.com/craftable_my-1.0.19.jar";
              hash = "sha256-U6xmumTcX6NyFYPnm3e0XcJGNFJQO/kSSsxH/aAur8o=";
            };
            SkinRestorer = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/ghrZDhGW/versions/leBCMyEe/skinrestorer-2.6.0%2B1.21.11-fabric.jar";
              hash = "sha256-GK87u4W6ffJPNPH1/Icwx6EwC2mCJrzUslSVnLh8G+0=";
            };
            ScalableLux = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/Ps1zyz6x/versions/PV9KcrYQ/ScalableLux-0.1.6%2Bfabric.c25518a-all.jar";
              hash = "sha256-ekpzcThhg8dVUjtWtVolHXWsLCP0Cvik8PijNbBdT8I=";
            };
            Sleeper = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/WTzuSu8P/versions/fUtpj4ud/sleep-v4.3.13-mc1.21.6%2B.jar";
              hash = "sha256-QCphU5O/EX53T6erJEOKbIVNTmDwXsJVqssR/q1/NYM=";
            };
            EasyAuth = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/aZj58GfX/versions/ZhMilNYO/easyauth-mc1.21.11-3.4.2.jar";
              hash = "sha256-4dk3jY0gBF7mFW8snUSChtDa69TqnBYSLzePTt9vW4c=";
            };
            Clumps = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/Wnxd13zP/versions/OgBE8Rz4/Clumps-fabric-1.21.11-29.0.0.1.jar";
              hash = "sha256-4yESCFKYF+XvzQ4u6W+cjFFui7reWihs1rii9OcPYWM=";
            };
            JorneyMap = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/lfHFW1mp/versions/VX8GZXvv/journeymap-fabric-1.21.11-6.0.0-beta.68.jar";
              hash = "sha256-mub/xOUWLTRuqNLYCqURTSFamj0XnOL+CPoqhi6jqHw=";
            };
            Fabric-API = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/i5tSkVBH/fabric-api-0.141.3%2B1.21.11.jar";
              hash = "sha256-hsRTqGE5Zi53VpfQOwynhn9Uc3SGjAyz49wG+Y2/7vU=";
            };
            FallingTree = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/Fb4jn8m6/versions/Hnj3s9Ez/FallingTree-1.21.11-1.21.11.3.jar";
              hash = "sha256-ioo8qJVyaL91RtXmptwY8wIU4JonZdagpzUFAfSGqJc=";
            };
            Lithium = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/Ow7wA0kG/lithium-fabric-0.21.4%2Bmc1.21.11.jar";
              hash = "sha256-UTXEHaW0PL3LKUJL3mUZUUOsQITiODTI6sBllCIBx4s=";
            };
            FerriteCore = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/uXXizFIs/versions/Ii0gP3D8/ferritecore-8.2.0-fabric.jar";
              hash = "sha256-92vXYMv0goDMfEMYD1CJpGI1+iTZNKis89oEpmTCxxU=";
            };
            C2ME = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/VSNURh3q/versions/olrVZpJd/c2me-fabric-mc1.21.11-0.3.6.0.0.jar";
              hash = "sha256-DwWNNWBfzM3xl+WpB3QDSubs3yc/NMMV3c1I9QYx3f8=";
            };
            Architectury = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/lhGA9TYQ/versions/uNdfrcQ8/architectury-19.0.1-fabric.jar";
              hash = "sha256-ZhOV1vC+8NOnlOLbdN9WAMc4e6b7lGsXIxWXcgGmZ8c=";
            };
            Cloth-Config = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/9s6osm5g/versions/xuX40TN5/cloth-config-21.11.153-fabric.jar";
              hash = "sha256-ikDITl7N5SWs+2xOE7gALaz8o++VNNf69ugEllb0I8g=";
            };
            JEI = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/u6dRKJwZ/versions/N7YozqFm/jei-1.21.11-fabric-27.4.0.15.jar";
              hash = "sha256-hfgfqATZOGg9gWklQ5wtCCq3wZXmWBnWbPmx/EgRrIA=";
            };
            Anvil = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/LrtCyjyV/versions/sRRYKoj0/too-expensive-removed-v1.2.5.jar";
              hash = "sha256-LLeNP9X6M/bLh0h/QdRfygo8jic8AUa7hcoCdFKSGcI=";
            };
          });
        };
      };
    };
  };
}
