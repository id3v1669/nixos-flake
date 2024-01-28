{ pkgs
, ...
}:
{
  home.packages = with pkgs; [
    # gui
    gimp                 # image editing
    over-outline-manager # outline manager vpn(proxy)

    # security
    over-veracrypt                # gui encryption

    # dev
    jetbrains.rider               # c# ide
    bootstrap-studio              # web design (front-end)

    # text & docs
    over-joplin                   # note taking app

    # files
    filezilla                     # ftp client
  ];
}