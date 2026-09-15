{
  pkgs,
  stable,
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
        FastConnectable = true;
        Experimental = true;
        ControllerMode = "dual";
      };
      Policy = {
        AutoEnable = true;
      };
    };
    input = {
      General = {
        ClassicBondedOnly = false;
      };
    };
  };
  systemd.user.services.mpris-proxy.wantedBy = ["default.target"];
}
