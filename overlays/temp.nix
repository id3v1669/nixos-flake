{
  system,
  inputs,
}: final: pkgs: {
  # Drop once nixpkgs ships a release newer than 1.4.1.
  xdg-desktop-portal-hyprland = pkgs.xdg-desktop-portal-hyprland.overrideAttrs (finalAttrs: prev: {
    version = "1.4.1-unstable-2026-08-29";
    src = pkgs.fetchFromGitHub {
      owner = "hyprwm";
      repo = "xdg-desktop-portal-hyprland";
      rev = "ba31964ee42b56bcb0d3b78a64ead5d8a1c3c6f6";
      hash = "sha256-TBqronrrc/F2Ry/E37d/1TLldDLJDFNSwvJjgk+cXzU=";
    };
  });
  pnpm_10_29_2 = pkgs.pnpm_10;
  electron_40 = pkgs.electron_44;
  electron_41 = pkgs.electron_44;
  electron_42 = pkgs.electron_44;
  electron_43 = pkgs.electron_44;
  electron = pkgs.electron_44;
}
