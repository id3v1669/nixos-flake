{pkgs, ...}: {
  imports = [
    ./../security.nix
  ];
  home.packages = with pkgs; [
    # gui
    gimp # image editing

    # text & docs
    joplin-desktop # note taking app

    # games
    prismlauncher

    iwwc
    czkawka-full
    dupeguru
  ];
}
