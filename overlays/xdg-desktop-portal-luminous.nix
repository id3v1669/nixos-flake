final: pkgs: {
  # nixpkgs' release is outdated; track latest master (upstream flake has issues)
  xdg-desktop-portal-luminous = pkgs.xdg-desktop-portal-luminous.overrideAttrs (finalAttrs: prev: {
    version = "0.1.14-unstable-2026-07-22";

    src = pkgs.fetchFromGitHub {
      owner = "waycrate";
      repo = "xdg-desktop-portal-luminous";
      rev = "5ba1e0c84b250007df4e1d060dbbc3a5b69becb8";
      hash = "sha256-9bHo20j02YLyriANvsGmyVypzuG4Ho9db2QBMIWQeyk=";
    };

    cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
      inherit (finalAttrs) pname version src;
      hash = "sha256-uCRxAb8V/8EPevcY9niXbky5JAHOoUu6ICdl+biGE+M=";
    };
  });
}
