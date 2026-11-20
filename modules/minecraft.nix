{
  pkgs,
  lib,
  uservars,
  inputs,
  ...
}: {
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
  users.users.${uservars.name}.extraGroups = ["minecraft"];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    user = "${uservars.name}";
    servers = {
      primary = {
        enable = true;
        autoStart = false;
        package = pkgs.fabricServers.fabric-26_3.override {
          jre_headless = pkgs.temurin-jre-bin-27;
        };
        jvmOpts = lib.concatStringsSep " " [
          "-Xms8G"
          "-Xmx8G"
          "-XX:+UnlockExperimentalVMOptions"
          "-XX:+UseG1GC"
          "-XX:MaxGCPauseMillis=200"
          "-XX:+DisableExplicitGC"
          "-XX:+AlwaysPreTouch"
          "-XX:G1NewSizePercent=30"
          "-XX:G1MaxNewSizePercent=40"
          "-XX:G1HeapRegionSize=8M"
          "-XX:G1ReservePercent=20"
          "-XX:G1MixedGCCountTarget=4"
          "-XX:G1IHOP=15"
          "-XX:G1MixedGCLiveThresholdPercent=90"
          "-XX:G1RSetUpdatingPauseTimePercent=5"
          "-XX:SurvivorRatio=32"
          "-XX:MaxTenuringThreshold=1"
          "-XX:+PerfDisableSharedMem"
          "-XX:+UseTransparentHugePages"
        ];
        openFirewall = true;
        serverProperties = {
          sync-chunk-writes = false;
          server-port = 25065;
          gamemode = "survival";
          difficulty = "hard";
          max-players = 12;
          max-chained-neighbor-updates = 10000;
          simulationDistance = 8;
          view-distance = 10;
          online-mode = false;
          allow-flight = true;
          white-list = false;
          enforce-whitelist = false;
        };
      };
    };
  };
}