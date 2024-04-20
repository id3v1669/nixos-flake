{ pkgs
, ...
}:
{
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;            
    settings = {
      General = {
        AutoEnable = true;
        FastConnectable = true;
        Experimental = true;
        Enable = "Sink,Media,Socket";
      };
    };
  };
  systemd.user.services.mpris-proxy = {
    description = "Mpris proxy";
    after = [ "network.target" "sound.target" ];
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
  };
}