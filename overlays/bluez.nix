final: pkgs: {
  bluez = pkgs.bluez.overrideAttrs (prev: {
    version = "5.87-unstable-2026-09-14";

    src = pkgs.fetchFromGitHub {
      owner = "bluez";
      repo = "bluez";
      rev = "c8e2b951b07fc9b84fa7f3e70dcde2b61aab3ad8";
      hash = "sha256-jPE9L7dTV42xTpOVHyfb/hsD5tXA8FEYb9Q4Z2eyAoQ=";
    };

    patches = builtins.filter (p: !(pkgs.lib.hasInfix "fix-uuid-discovery-segfault" (toString p))) prev.patches;
  });
}
