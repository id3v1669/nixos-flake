{ pkgs
, ...
}:
{
  home.packages = with pkgs; [
    # text & docs
    over-joplin                                            # note taking app
    over-prismlauncher

    optipng
    sassc
    gtk-engine-murrine
    inkscape-with-extensions
  ];
}