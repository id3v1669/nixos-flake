final: pkgs: {
  steam = pkgs.steam.override {
    extraLibraries = pkgs:
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
