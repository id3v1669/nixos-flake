final: pkgs: {
  steam = pkgs.steam.override {
    extraPkgs = pkgs:
      with pkgs; [
        libxcursor
        libxi
        libxinerama
        libxscrnsaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        libkrb5
        keyutils
        curl
      ];
  };
}
