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
      jdks = with pkgs; [ zulu27 temurin-jre-bin-27 ];
    })

    #qxmledit
    czkawka-full
    yt-dlp
    megasync
    wxedid
  ];
}
