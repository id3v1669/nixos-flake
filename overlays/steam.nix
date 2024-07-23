{ pkgs
, ...
}: 
(pkgs.steam.override {
  extraPkgs = pkgs: with pkgs; [
    xorg.libXcursor
    xorg.libXi
    xorg.libXinerama
    xorg.libXScrnSaver
    libpng
    libpulseaudio
    libvorbis
    stdenv.cc.cc.lib
    libkrb5
    keyutils
  ];
}).overrideAttrs (oldAttrs: rec {
  version = "1.0.0.79";
  src = pkgs.fetchurl {
    url = "https://repo.steampowered.com/steam/archive/stable/steam_1.0.0.79.tar.gz";
    sha256 = "sha256-OgAS2vWIkxHC4dzzOlh7QJAZtm2JOlIZLfaUfhjx7EY=";
  };
})