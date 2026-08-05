{
  system,
  inputs,
}: final: pkgs: {
  gpu-screen-recorder = pkgs.gpu-screen-recorder.overrideAttrs (finalAttrs: prev: {
    version = "5.15.3";

    src = pkgs.fetchgit {
      url = "https://repo.dec05eba.com/gpu-screen-recorder";
      rev = "aa69bdee8d3baf6819598304bb9e9a5a0c1a945c";
      hash = "sha256-QLQ14eYJm+Ayqtgw+M+M6/+D4nLmoK/9fzP8rBqwrRg=";
    };
    patches =
      (prev.patches or [])
      ++ [
        ./gpu-screen-recorder-force-invalid-modifier.patch
      ];
  });
  pnpm_10_29_2 = pkgs.pnpm_10;
  electron_40 = pkgs.electron_43;
  electron_41 = pkgs.electron_43;
  electron_42 = pkgs.electron_43;
  electron = pkgs.electron_43;
}
