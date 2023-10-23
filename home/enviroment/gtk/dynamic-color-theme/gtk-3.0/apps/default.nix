{ config, lib, ... }:
{
  imports = [
    ./budgie-css.nix
    ./corebird-css.nix
    ./gala-css.nix
    ./gnome-applications-css.nix
    ./mate-applications-css.nix
    ./solus-applications-css.nix
    ./unity-css.nix
  ];
}