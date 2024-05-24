{ pkgs
, ...
}:
{
  systemd.user.services.nm-applet = {
		Unit = {
      Description = "Network Manager applet service";
   	  After = ["graphical-session-pre.target"];
      PartOf = ["graphical-session.target"];
    };
		Service = {
			ExecStart = "${pkgs.networkmanagerapplet}/bin/nm-applet";
      Restart = "on-failure";
		};
		Install = { WantedBy = ["graphical-session.target"]; };
  };
  systemd.user.services.blueman-applet = {
		Unit = {
      Description = "Blueman applet service";
   	  After = ["graphical-session-pre.target" "bluetooth.target" ];
      PartOf = ["graphical-session.target"];
    };
		Service = {
			ExecStart = "${pkgs.blueman}/bin/blueman-applet";
      Restart = "on-failure";
		};
		Install = { WantedBy = ["graphical-session.target"]; };
  };
  systemd.user.services.cliphist = {
    Unit = {
      Description = "Clipboard management daemon";
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store";
      Restart = "on-failure";
    };
    Install = { WantedBy = [ "graphical-session.target" ]; };
  };
}