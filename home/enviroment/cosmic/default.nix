{pkgs, ...}: {
  imports = [
    ./files.nix
  ];
  home.packages = [pkgs.cosmic-theme-import];
}
