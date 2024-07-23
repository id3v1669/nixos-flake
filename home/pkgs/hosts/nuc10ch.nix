{ pkgs
, ...
}:
{
  home.packages = with pkgs; [
    # text & docs
    joplin-desktop

    optipng
    sassc
    gtk-engine-murrine
    inkscape-with-extensions
  ];
}