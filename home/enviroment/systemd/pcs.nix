{
  pkgs,
  stable,
  lib,
  ...
}: let
  inherit (lib) getExe';
in {
  systemd.user.services.nm-applet = {
    Unit = {
      Description = "Network Manager applet service";
      After = ["graphical-session-pre.target"];
      PartOf = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${getExe' pkgs.networkmanagerapplet "nm-applet"}";
      Restart = "on-failure";
    };
    Install = {WantedBy = ["graphical-session.target"];};
  };
  systemd.user.services.blueman-applet = {
    Unit = {
      Description = "Blueman applet service";
      After = ["graphical-session-pre.target" "bluetooth.target"];
      PartOf = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${getExe' pkgs.blueman "blueman-applet"}";
      Restart = "on-failure";
    };
    Install = {WantedBy = ["graphical-session.target"];};
  };
  systemd.user.services.cliphist = {
    Unit = {
      Description = "Clipboard management daemon";
      PartOf = ["graphical-session.target"];
    };
    Service = {
      Type = "simple";
      ExecStart = "${getExe' pkgs.wl-clipboard "wl-paste"} --type text --watch ${getExe' pkgs.cliphist "cliphist"} store";
      Restart = "on-failure";
    };
    Install = {WantedBy = ["graphical-session.target"];};
  };
}
