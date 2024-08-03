{ pkgs
, ...
}:
{
  home.packages = with pkgs; [
    # text & docs
    joplin-desktop
  ];
}