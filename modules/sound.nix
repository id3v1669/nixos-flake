{ pkgs
, ...
}:
{
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  programs.noisetorch.enable = true;
  services.pipewire = {
    enable = true;
    package = pkgs.pipewire;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber = {
      enable = true;
      configPackages = [
        (pkgs.writeTextDir "share/bluetooth.lua.d/51-bluez-config.lua" ''
          bluez_monitor.properties = {
            ["bluez5.roles"] = "[ a2dp_sink bap_sink ]",
            ["bluez5.enable-sbc-xq"] = true,
            ["bluez5.enable-msbc"] = true,
            ["bluez5.hfphsp-backend"] = "none",
            ["bluez5.enable-hw-volume"] = true,
            ["bluez5.reconnect-profiles"] = "[ a2dp_sink bap_sink ]",
            ["bluez5.headset-roles"] = "[ ]"
          }
        '')
      ];
    };
  };
}