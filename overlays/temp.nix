{
  system,
  inputs,
}: final: pkgs: {
  gpu-screen-recorder = pkgs.gpu-screen-recorder.overrideAttrs (finalAttrs: prev: {
    version = "5.13.8-git";

    src = pkgs.fetchgit {
      url = "https://repo.dec05eba.com/gpu-screen-recorder";
      rev = "60f0459f840f568159a320f58d56063ba02e52c4";
      hash = "sha256-Nm4LshXtJ41SxYdxUZiOmEyF0JLeRGVbmP7v/ZJikCY=";
    };

    patches =
      (prev.patches or [])
      ++ [
        ./gpu-screen-recorder-force-invalid-modifier.patch
      ];
  });
  pnpm_10_29_2 = pkgs.pnpm_10;
}
