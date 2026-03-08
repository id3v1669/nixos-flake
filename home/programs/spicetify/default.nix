{
  pkgs,
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
      adblock
      hidePodcasts
      shuffle
      ({
        src = ''${pkgs.fetchFromGitHub {
          owner = "Socketlike";
          repo = "spicetify-extensions";
          rev = "a714f85c1a2024be1d44fbff94bacb79e6102f00";
          hash = "sha256-/Sv/RvP1E9CkXwlePhw2bfo3GBmxMJUHF5UJN0Xhr+I=";
        }}/priority-queue'';
        name = "priority-queue.js";
    })
      volumePercentage
      copyToClipboard
      trashbin
    ];
    theme = spicePkgs.themes.onepunch;
    colorScheme = "dark";
  };
}
