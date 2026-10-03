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

    qxmledit
    czkawka-full
    yt-dlp
    megasync
    wxedid
  ];
}
