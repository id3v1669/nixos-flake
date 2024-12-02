{ pkgs
, ...
}:
{
  home.packages = with pkgs; [
    # gui
    gimp                                 # image editing

    # text & docs
    joplin-desktop                       # note taking app

    # games
    prismlauncher
  ];
}