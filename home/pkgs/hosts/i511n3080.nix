{ pkgs
, ...
}:
{
  home.packages = with pkgs; [
    # text & docs
    joplin-desktop                # note taking app
    spotify

    # dev
    jetbrains.rust-rover          # rust ide

    prismlauncher
    
    libsForQt5.kdenlive           # video editing
    gimp                          # image editing

    #for gtk theme testing
    # swaynotificationcenter
    # optipng
    # sassc
    # gtk-engine-murrine
    # inkscape-with-extensions
    # gnome-themes-extra
    # geary
    # totem
    # evince
    # gedit
    # gnome-terminal
    # lollypop
    # gnome-calendar
    # gnome-system-monitor

  ];
}
