final: pkgs: {
  lutris-unwrapped = pkgs.lutris-unwrapped.overrideAttrs {
    version = "0.5.20";
    src = pkgs.fetchFromGitHub {
      owner = "lutris";
      repo = "lutris";
      rev = "232c9d8cec74ee7a4d21ce6cb624aa8a14f3e18b";
      hash = "sha256-3t+x3gMuPah7FPYv9J73N7OPgXhWQ2K7vmGn8USLXzQ=";
    };
  };
  lutris = pkgs.lutris.override {
    extraPkgs = pkgs:
      with pkgs; [
        speex
        speexdsp
        SDL2_sound
        winetricks
        wineWow64Packages.unstableFull
        v4l-utils
      ];
  };
}
