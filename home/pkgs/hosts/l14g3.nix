{ pkgs
, ...
}:
{
  home.packages = with pkgs; [
    # gui
    gimp                                                   # image editing
    #over-outline-manager                                  # outline manager vpn(proxy)

    # dev
    jetbrains.rust-rover                                   # rust ide

    # text & docs
    over-joplin                                            # note taking app

    # files
    filezilla                                              # ftp client

    over-prismlauncher

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
    lollypop
    gnome-calendar
    inkscape-with-extensions
    gnome-system-monitor
  ];
}