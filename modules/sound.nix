{
  config,
  pkgs,
  uservars,
  ...
}: {
  services = {
    pipewire = {
      enable = true;
      systemWide = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber = {
        enable = true;
        configPackages = [
          (pkgs.runCommand "wireplumber-bose-a2dp-only" {} ''
            scriptDir="$out/share/wireplumber/scripts/monitors/bluez"
            mkdir -p "$scriptDir"
            cat ${./wireplumber/bose-a2dp-only.lua} \
              ${config.services.pipewire.wireplumber.package}/share/wireplumber/scripts/monitors/bluez/enumerate-device.lua \
              > "$scriptDir/enumerate-device.lua"
          '')
        ];
        extraConfig = {
          "monitor.bluez.properties" = {
            "bluez5.enable-sbc-xq" = true;
            "bluez5.enable-hw-volume" = true;
            "bluez5.codecs" = ["sbc_xq" "aac"];
          };
          "99-disable-libcamera" = {
            "wireplumber.profiles" = {
              main = {
                "monitor.libcamera" = "disabled";
              };
            };
          };
        };
      };
      # ban electron&chrome from changing volume
      extraConfig.pipewire-pulse."93-block-mic-volume" = {
        "pulse.rules" = [
          {
            matches = [
              {"application.name" = "Chromium input";}
            ];
            actions = {quirks = ["block-source-volume"];};
          }
        ];
      };
    };
    mpd = {
      enable = true;
      openFirewall = true;
      settings = {
        music_directory = "/mnt/share/Music";
        bind_to_address = "any";
        audio_output = [
          {
            type = "pipewire";
            name = "PipeWire Sound Server";
          }
        ];
      };
    };
  };
  systemd.services.mpd.serviceConfig.SupplementaryGroups = ["pipewire"];
  users.users.${uservars.name}.extraGroups = ["pipewire"];
}
