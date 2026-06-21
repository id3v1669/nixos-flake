{
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
        extraConfig = {
          "monitor.bluez.properties" = {
            "bluez5.enable-sbc-xq" = true;
            "bluez5.enable-hw-volume" = true;
            "bluez5.enable-msbc" = false;
            "bluez5.codecs" = ["sbc_xq" "aac"];
            "bluez5.roles" = ["a2dp_sink"];
          };
          "wireplumber.settings" = {
            "bluetooth.autoswitch-to-headset-profile" = false;
          };
          "99-disable-libcamera" = {
            "wireplumber.profiles" = {
              main = {
                "monitor.libcamera" = "disabled";
              };
            };
          };
          "51-android-mic-route" = {
            "node.rules" = [
              {
                matches = [
                  {"node.name" = "alsa_playback..android-mic-wrapped";}
                ];
                actions = {
                  update-props = {
                    "target.object" = "amic";
                  };
                };
              }
            ];
          };
        };
      };
      extraConfig.pipewire-pulse."92-android-mic" = {
        "pulse.cmd" = [
          {
            cmd = "load-module";
            args = "module-null-sink sink_name=amic sink_properties=device.description=AndroidMic";
          }
          {
            cmd = "load-module";
            args = "module-remap-source master=amic.monitor source_name=amic_source source_properties=device.description=AndroidMic";
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
