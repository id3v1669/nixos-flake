{ pkgs
, config
, envir
, colorsvar
, uservars
, ...
}:
{
  imports = [
    ./dotnet.nix
    ./ss.nix
  ];
  home.packages = let cp = pkgs.callPackage; in [
    (cp ./distrobox.nix {config = config;})
    (cp ./eww-launcher.nix {envir = envir;})
    (cp ./eww-move.nix {})
    (cp ./shadowplay.nix {envir = envir;})
    (cp ./wallpaper.nix {envir = envir; config = config; colorsvar = colorsvar; uservars = uservars;})
    (cp ./microphone-toggle.nix {})
  ];
}