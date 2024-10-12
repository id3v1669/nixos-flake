{ pkgs
, ...
}:
{
  home.packages = with pkgs; [
    # gui
    gimp                                 # image editing

    # dev
    jetbrains.rust-rover                 # rust ide

    # text & docs
    joplin-desktop                       # note taking app

    # games
    prismlauncher
  ];
}