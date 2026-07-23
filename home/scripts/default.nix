{
  pkgs,
  lib,
  config,
  envir,
  colorsvar,
  uservars,
  inputs,
  ...
}: {
  home.packages = let
    cp = pkgs.callPackage;
  in [
    (cp ./shadowplay.nix {inherit envir;})
    (cp ./wallpaper.nix {
      inherit envir;
      inherit config;
      inherit colorsvar;
      inherit uservars;
    })
    (cp ./url-handler.nix {
      inherit config;
    })

  ] ++ lib.lists.optionals (envir == "Hyprland" || envir == "sway" || envir == "mango") [
    (cp ./iwwc-launcher.nix {inherit envir;})
  ];
}
