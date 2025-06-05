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
        package = pkgs.fabricServers.fabric-1_21_5.override {
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
              url = "https://mediafilez.forgecdn.net/files/6561/465/skinrestorer-2.3.2%2B1.21.5-fabric.jar";
              hash = "sha256-0M3D5uwqCMlwWcpegVFYYvZwVCksKNOnG0qj0bE9FAE=";
            };
            ScalableLux = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6345/713/ScalableLux-0.1.3%2Bbeta.1%2Bfabric.4039a8d-all.jar";
              hash = "sha256-Vhu0ejRPdHvme5JlIoK5UaN0AClAfT5yv/pJhRshPN0=";
            };
            Sleeper = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/WTzuSu8P/versions/qlOH7jKR/sleep-v.4.0.2.jar";
              hash = "sha256-BytI7H8+b7lvN0+CghvrvdZZfGwoL6OEDbTI4lW9S8Y=";
            };
            EasyAuth = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6444/87/easyauth-mc1.21.5-3.2.1.jar";
              hash = "sha256-cCG6IjVNAT2rcjbyS1X/N8tT+lTqroMP2197woOBL3k=";
            };
            Clumps = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6368/575/Clumps-fabric-1.21.5-23.0.0.1.jar";
              hash = "sha256-6drvtEzHBdrjZBSIU++TlE44K1K7UJvH2bvEWD7S63s=";
            };
            JorneyMap = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6550/383/journeymap-fabric-1.21.5-6.0.0-beta.47.jar";
              hash = "sha256-njkBhzZgcnr3f09WwHZoyXs9A/fop66+AdFPlQjlPo8=";
            };
            Fabric-API = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6601/671/fabric-api-0.125.3%2B1.21.5.jar";
              hash = "sha256-IsyR8uENey1x/wZnpL99ujF+m1Bp27SPw3HsbWeeZug=";
            };
            FallingTree = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6586/711/FallingTree-1.21.5-1.21.5.9.jar";
              hash = "sha256-WBDHVHFiLoShHSEafmjUlwcw7HI3fS9+xVwiAV22d8Q=";
            };
            Lithium = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6401/322/lithium-fabric-0.16.2%2Bmc1.21.5.jar";
              hash = "sha256-XqvnQxASa4M0l3JJxi5Ej6TMHUWgodOmMhwbzWuMYGg=";
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
              url = "https://mediafilez.forgecdn.net/files/6564/728/c2me-fabric-mc1.21.5-0.3.3.0.0.jar";
              hash = "sha256-APLnOZFRzvqKGN0aYLyHz53DWEa3BUjBMiUw2zuKIyg=";
            };
            Architectury = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6406/227/architectury-16.1.4-fabric.jar";
              hash = "sha256-qdU8fE9qozKcJ/K4grnK6eOHBv1rYcySLkuFKeirAxs=";
            };
            Cloth-Config = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6351/756/cloth-config-18.0.145-fabric.jar";
              hash = "sha256-7GcBJ2Gu6GwUCpEDWMSd28JLhS6YBweUBwVyHhv/Xn8=";
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
