{
  pkgs,
  stable,
  lib,
  ...
}: {
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    package =
      (pkgs.bluez.override {
        enableExperimental = true;
      }).overrideAttrs (old: {
        version = "5.86-unstable-2026-05-29";
        src = pkgs.fetchFromGitHub {
          owner = "bluez";
          repo = "bluez";
          rev = "17fbb48d8f7c22d0702b3b9daf69f9c06231d774";
          hash = "sha256-9pyd0DvKInlgntAUtSJ6Qy+o+K7uesrgmb86Qcy+7K0=";
        };
        patches = [];
      });
    settings = {
      General = {
        AutoEnable = true;
        FastConnectable = true;
        Experimental = true;
        ControllerMode = "dual";
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
