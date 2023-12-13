{ pkgs
, ...
}:
{
  home.packages = with pkgs; [
    spotify              # music
    gimp                 # image editing
    over-outline-manager # outline manager vpn(proxy)
  ];
}