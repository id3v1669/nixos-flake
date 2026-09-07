{
  pkgs,
  stable,
  ...
}: {
  imports = [
    #./../security.nix
  ];
  home.packages = with pkgs; [
    # text & docs
    joplin-desktop # note taking app

    gimp
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
    czkawka-full
    yt-dlp
    megasync
    wxedid
  ];
}
