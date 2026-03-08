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
      jdks = with pkgs; [jdk25 zulu zulu17];
    })

    #tmp for testing themes
    cosmic-settings
    cosmic-edit
    cosmic-reader
    cosmic-player
    cosmic-launcher
    cosmic-term

    qxmledit
    czkawka-full
    q
    yt-dlp
    stable.megasync
    wxedid
  ];
}
