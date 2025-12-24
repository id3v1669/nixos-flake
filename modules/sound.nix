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
        };
      };
    };
    mpd = {
      enable = true;
      openFirewall = true;
      settings = {
        music_directory = "/mnt/share/Music";
        bind_to_address = "any";
        audio_output = [{
          type = "pipewire";
          name = "PipeWire Sound Server";
        }];
      };
    };
  };
  systemd.services.mpd.serviceConfig.SupplementaryGroups = ["pipewire"];
  users.users.${uservars.name}.extraGroups = ["pipewire"];
}
