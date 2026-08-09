{
  nixpkgs,
  kernel,
}: let
  pkgs = import nixpkgs {
    #TODO fix for arm host
    localSystem = "x86_64-linux";
    crossSystem = "aarch64-linux";
  };
in
  pkgs.linuxPackagesFor kernel
