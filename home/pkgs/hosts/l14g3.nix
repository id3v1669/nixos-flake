{ pkgs
, ...
}:
{
  home.packages = with pkgs; [
    # gui
    gimp                                 # image editing
    #over-outline-manager                # outline manager vpn(proxy)

    # dev
    jetbrains.rust-rover                 # rust ide

    # text & docs
    joplin-desktop                       # note taking app

    # files
    filezilla                            # ftp client

    prismlauncher
    spotify

    #for gtk theme testing
    optipng
    sassc
    gtk-engine-murrine
    gnome-themes-extra
    geary
    totem
    evince
    gedit
    gnome-terminal
    #lollypop
    gnome-calendar
    inkscape-with-extensions
    gnome-system-monitor
  ];
}