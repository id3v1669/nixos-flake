{ pkgs
, uservars
, ...
}:
{
  programs.noisetorch.enable = true;
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      systemWide = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    mpd = {
      enable = true;
      musicDirectory = "/mnt/share/Music";
      network.listenAddress = "any";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "PipeWire Sound Server"
        }
      '';
    };
  };
  systemd.services.mpd.serviceConfig.SupplementaryGroups = [ "pipewire" ];
  users.users.${uservars.name}.extraGroups = [ "pipewire" ];
}