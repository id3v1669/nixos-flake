{
  pkgs,
  lib,
  ...
}: {
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez.override {
      enableExperimental = true;
    };
    settings = {
      General = {
        AutoEnable = true;
        FastConnectable = true;
        Experimental = true;
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };
  systemd.user.services.mpris-proxy = {
    description = "Mpris proxy";
    after = ["network.target" "sound.target"];
    wantedBy = ["default.target"];
    serviceConfig.ExecStart = "${lib.getExe' pkgs.bluez "mpris-proxy"}";
  };
}
