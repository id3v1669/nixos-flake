{ pkgs
, ...
}:
{
  home.packages = with pkgs; [
    # gui
    gimp                                                   # image editing
    #over-outline-manager                                  # outline manager vpn(proxy)

    # security
    veracrypt                                              # gui encryption

    # dev
    jetbrains.rust-rover                                   # rust ide

    # text & docs
    over-joplin                                            # note taking app

    # files
    filezilla                                              # ftp client

    #for gtk theme testing
    optipng
    sassc
    gtk-engine-murrine
    gnome.gnome-themes-extra
    gnome.geary
    gnome.totem
    evince
    gedit
    gnome.gnome-terminal
    lollypop
    gnome.gnome-calendar
    inkscape-with-extensions
    gnome.gnome-system-monitor
  ];
}