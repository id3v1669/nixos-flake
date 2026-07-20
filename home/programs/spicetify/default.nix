{
  pkgs,
  stable,
  inputs,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    enable = true;
    spotifyPackage = pkgs.spotify;
    enabledExtensions = with spicePkgs.extensions; [
      hidePodcasts
      shuffle
      {
        src = ''${pkgs.fetchFromGitHub {
            owner = "Socketlike";
            repo = "spicetify-extensions";
            rev = "216c42469f85e5de35a73eaa3c7a7f5a7990568f";
            hash = "sha256-E9BFi5iGPuEKM70QBma1b+Qh0wpH79rcSrFLvTnd2zU=";
          }}/priority-queue'';
        name = "priority-queue.js";
      }
      {
        src = ''${pkgs.fetchFromGitHub {
            owner = "Socketlike";
            repo = "spicetify-extensions";
            rev = "216c42469f85e5de35a73eaa3c7a7f5a7990568f";
            hash = "sha256-E9BFi5iGPuEKM70QBma1b+Qh0wpH79rcSrFLvTnd2zU=";
          }}/volume-percentage'';
        name = "volume-percentage.js";
      }
      copyToClipboard
      trashbin
    ];
    theme = spicePkgs.themes.onepunch;
    colorScheme = "dark";
  };
}
