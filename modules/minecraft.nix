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
        package = pkgs.fabricServers.fabric-1_21_10.override {
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
            tt20 = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/YS3ZignI/versions/Htc1MpMN/tt20-0.7.2%2Bmc1.21.9.jar";
              hash = "sha256-zjiYTOb0gGXQJ4elnhxwsx/STq+0Cmz/xwdnx/Du5Uc=";
            };
            Async = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/vEC2jm6I/versions/jW2W1uoQ/async-fabric-0.1.8%2Balpha.1-1.21.10.jar";
              hash = "sha256-Up88/NMQBXU2tZZVoKTCNQItyxO7xALTBx1c0XgLI9Q=";
            };
            Terralith = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/8oi3bsk5/versions/JKg71Gq0/Terralith_1.21.x_v2.5.13.jar";
              hash = "sha256-lI2ZmwJuNE/XIBUHeJrrKCL0eKUtxE2r4evMFJVIx1I=";
            };
            Quartz = pkgs.fetchurl {
              url = "https://id3v1669.com/craftable_quartz-1.0.17.jar";
              hash = "sha256-/X4XsnSaU0NqdOMFsoy+wGG9wFlTO4TZZ9DxZUez6I0=";
            };
            Coal = pkgs.fetchurl {
              url = "https://id3v1669.com/craftable_charcoal_block-1.0.17.jar";
              hash = "sha256-YbzZ4JRz0ewX5zpX1h4JRbYfGwaaZ1HUGJn9GPo37Rc=";
            };
            GApple = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/4CVPn6z8/versions/1EsDlHHp/craftable_enchanted_golden_apple-1.0.17.jar";
              hash = "sha256-y2Fqo2X5np+X7Ttpzpy6oRDBtW83y9I+wRIFF9N2knM=";
            };
            SkinRestorer = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/ghrZDhGW/versions/MKWfnXfO/skinrestorer-2.4.3%2B1.21.9-fabric.jar";
              hash = "sha256-ypyDuX94HyUPlUI4CrFc0Pc01lUQXgYPqP/axaCi6Hc=";
            };
            ScalableLux = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/Ps1zyz6x/versions/PV9KcrYQ/ScalableLux-0.1.6%2Bfabric.c25518a-all.jar";
              hash = "sha256-ekpzcThhg8dVUjtWtVolHXWsLCP0Cvik8PijNbBdT8I=";
            };
            Sleeper = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/WTzuSu8P/versions/msWvQlVW/sleep-v4.2.6.jar";
              hash = "sha256-x6ongiWpOrIWf/q4AdHVgSgcAbpcwdE8OZj5yQG+U04=";
            };
            EasyAuth = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/aZj58GfX/versions/4ymSCTJS/easyauth-mc1.21.9-3.4.0.jar";
              hash = "sha256-/QbS8YOdfdNsmJiPYtlsClBEWDAbl6DNtQTez/6nQDc=";
            };
            Clumps = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/Wnxd13zP/versions/8BikzIOh/Clumps-fabric-1.21.10-28.0.0.1.jar";
              hash = "sha256-CwjQ3RQWUOtrO4Bg4gNkKiKWqwDElMvwPItgbZLBFdI=";
            };
            JorneyMap = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/lfHFW1mp/versions/ZVnVNvom/journeymap-fabric-1.21.10-6.0.0-beta.53.jar";
              hash = "sha256-pqgZ6L+RFSZ8wT8j13e5U0xn/h775T1dgZ8yqddzdDg=";
            };
            Fabric-API = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/dQ3p80zK/fabric-api-0.138.3%2B1.21.10.jar";
              hash = "sha256-rCB1kEGet1BZqpn+FjliQEHB1v0Ii6Fudi5dfs9jOVM=";
            };
            FallingTree = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/Fb4jn8m6/versions/hDjB8uAg/FallingTree-1.21.10-1.21.10.1.jar";
              hash = "sha256-REGT6S7u38WU4xzIEKWrVIitTj5Nic5fYrjOh08ho4c=";
            };
            Lithium = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/oGKQMdyZ/lithium-fabric-0.20.0%2Bmc1.21.10.jar";
              hash = "sha256-567yN1D2eJgsAMQhjWIFljqZRVRFfCoWvZgY41IQAEs=";
            };
            FerriteCore = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/uXXizFIs/versions/MGoveONm/ferritecore-8.0.2-fabric.jar";
              hash = "sha256-LGn9gXMEu2l1zUti/TK/IaXVyPDDUj6sxzTAwlB+2nc=";
            };
            C2ME = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/VSNURh3q/versions/uNick7oj/c2me-fabric-mc1.21.10-0.3.5.1.0.jar";
              hash = "sha256-pqUSN/OqZOF7p3g/iKO71c2830/eDg7OsFkhZ0AR9GQ=";
            };
            Architectury = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/lhGA9TYQ/versions/8Ing3Dbx/architectury-18.0.6-fabric.jar";
              hash = "sha256-UHu/MENJbwxEBorlvTEEJ3X5UmJOs5iOPImQZ+3X3FU=";
            };
            Cloth-Config = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/9s6osm5g/versions/qMxkrrmq/cloth-config-20.0.149-fabric.jar";
              hash = "sha256-BmpEfjQjoYLayMSyWmk8cmMIo9PLPfMW1ViAmbR1F4c=";
            };
            Krypton = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/fQEb0iXm/versions/O9LmWYR7/krypton-0.2.10.jar";
              hash = "sha256-lCkdVpCgztf+fafzgP29y+A82sitQiegN4Zrp0Ve/4s=";
            };
            JEI = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/u6dRKJwZ/versions/pu0hh0wd/jei-1.21.10-fabric-26.1.0.16.jar";
              hash = "sha256-yHvAvRbAz7G8/NzwQO3vTKNi9LSg7Sh24TsR7nA4+2M=";
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
