{ pkgs
, ...
}:
{
  home.packages = with pkgs; [
    # text & docs
    over-joplin                   # note taking app

    # dev
    jetbrains.rust-rover          # rust ide


    #over-prismlauncher           # minecraft launcher
    prismlauncher
    
    libsForQt5.kdenlive           # video editing
    gimp                          # image editing

    #for gtk theme testing
    optipng
    sassc
    gtk-engine-murrine
    inkscape-with-extensions
    gnome-themes-extra
    geary
    totem
    evince
    gedit
    gnome-terminal
    lollypop
    gnome-calendar
    gnome-system-monitor

  ];
}
