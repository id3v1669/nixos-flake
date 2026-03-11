{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    #./../security.nix
  ];
  home.packages = with pkgs; [
    # text & docs
    joplin-desktop # note taking app

    # games
    (prismlauncher.override {
      jdks = with pkgs; [jdk25 zulu zulu17];
    })
  ];
}
