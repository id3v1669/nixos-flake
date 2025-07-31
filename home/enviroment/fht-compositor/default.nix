_: {
  # systemd.user.services.xwayland-satellite = {
  #     Unit = {
  #       Description = "Xwayland satellite service";
  #       After = [ config.wayland.systemd.target ];
  #       PartOf = [ config.wayland.systemd.target ];
  #       BindsTo = [ config.wayland.systemd.target ];
  #       Requisite = [ config.wayland.systemd.target ];
  #     };
  #     Service = {
  #       Type = "notify";
  #       NotifyAccess = "all";
  #       ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite";
  #       StandardOutput = "journal";
  #     };
  #     Install.WantedBy = [ config.wayland.systemd.target ];
  #   };
}
