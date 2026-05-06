{
  pkgs,
  stable,
  lib,
  ...
}: {
  services.blueman = {
    enable = true;
    withApplet = true;
  };
  hardware.bluetooth = {
    enable = true;
    package = stable.bluez.override {
      enableExperimental = true;
    };
    settings = {
      General = {
        AutoEnable = true;
        FastConnectable = true;
        Experimental = true;
        ControllerMode = "bredr";
        Enable = "Source,Sink,Media,Socket";
      };
      Input = {
        ClassicBondedOnly = false;
      };
      Policy = {
        AutoEnable = true;
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
