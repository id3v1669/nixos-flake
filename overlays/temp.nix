{
  system,
  inputs,
}: final: pkgs: {
  gpu-screen-recorder = pkgs.gpu-screen-recorder.overrideAttrs (finalAttrs: prev: {
    version = "6.0.1";

    src = pkgs.fetchgit {
      url = "https://repo.dec05eba.com/gpu-screen-recorder";
      rev = "7bba0f0f1f698b574096f135fa7d5a761264b26f";
      hash = "sha256-+W1C0sP6ltkfCP9To7NdHRM/5oUqKn3b/uDkhZJGWG0=";
    };
    patches =
      (prev.patches or [])
      ++ [
        ./gpu-screen-recorder-force-invalid-modifier.patch
      ];
  });
  pnpm_10_29_2 = pkgs.pnpm_10;
  electron_40 = pkgs.electron_44;
  electron_41 = pkgs.electron_44;
  electron_42 = pkgs.electron_44;
  electron_43 = pkgs.electron_44;
  electron = pkgs.electron_44;
}
