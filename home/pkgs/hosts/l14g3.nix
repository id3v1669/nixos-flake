{
  pkgs,
  stable,
  ...
}: {
  imports = [
    #./../security.nix
  ];
  home.packages = with pkgs; [
    # gui
    #gimp # image editing

    # text & docs
    joplin-desktop # note taking app

    # games
    (prismlauncher.override {
      jdks = with pkgs; [jdk25 zulu];
    })

    #tmp for testing themes
    cosmic-settings
    cosmic-edit
    cosmic-reader
    cosmic-player
    cosmic-launcher
    cosmic-term

    qxmledit
    #iwwc
    czkawka-full
    dupeguru
    yt-dlp
    stable.megasync

    librepods
    wxedid
  ];

  # temp until I fix aplin project
  systemd.user.services.librepods = {
    Unit = {
      Description = "librepods";
      After = ["graphical-session.target"];
      PartOf = ["graphical-session.target"];
      ConditionEnvironment = "WAYLAND_DISPLAY";
    };

    Service = {
      Type = "simple";
      ExecStart = "${pkgs.lib.getExe pkgs.librepods} --hide";
      Restart = "always";
      RestartSec = 1;
      TimeoutStopSec = 10;
      Environment = "PHONE_MAC_ADDRESS=28:2D:7F:DF:BC:76";
    };

    Install.WantedBy = ["graphical-session.target"];
  };
}
