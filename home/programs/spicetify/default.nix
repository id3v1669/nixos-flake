{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;
    spotifyPackage = pkgs.spotify-custom;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle
      addToQueueTop
      volumePercentage
      copyToClipboard
      trashbin
    ];
    theme = spicePkgs.themes.onepunch;
    colorScheme = "dark";
  };
}
