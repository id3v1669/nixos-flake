final: pkgs: {
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
