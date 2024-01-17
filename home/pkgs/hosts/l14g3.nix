{ pkgs
, ...
}:
{
  home.packages = with pkgs; [
    # gui
    gimp                 # image editing
    over-outline-manager # outline manager vpn(proxy)

    # text & docs
    over-joplin                   # note taking app

    # files
    filezilla                     # ftp client
  ];
}