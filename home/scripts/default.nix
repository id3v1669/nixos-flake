{
  pkgs,
  config,
  stable,
  envir,
  colorsvar,
  uservars,
  ...
}: {
  imports = [
    ./dotnet.nix
    ./ss.nix
  ];
  home.packages = let
    cp = pkgs.callPackage;
  in [
    (cp ./distrobox.nix {inherit config;})
    (cp ./eww-launcher.nix {inherit envir;})
    (cp ./eww-move.nix {})
    (cp ./shadowplay.nix {inherit envir;})
    (cp ./wallpaper.nix {
      inherit envir;
      inherit config;
      inherit colorsvar;
      inherit uservars;
    })
    (cp ./microphone-toggle.nix {})
  ];
}
