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
    curl
  ];
}).overrideAttrs (oldAttrs: rec {
  # version = "1.0.0.79";
  # src = pkgs.fetchurl {
  #   url = "https://repo.steampowered.com/steam/archive/stable/steam_1.0.0.79.tar.gz";
  #   sha256 = "sha256-OgAS2vWIkxHC4dzzOlh7QJAZtm2JOlIZLfaUfhjx7EY=";
  # };
  # # UNFINISHED DO NOT USE
  # srcmil = pkgs.fetchurl {
  #   url="https://github.com/SteamClientHomebrew/Millennium/releases/download/v2.11.1/millennium-v2.11.1-linux-x86_64.tar.gz";
  #   hash = "sha256-dqwigLzkesLCtwUHk3fhiOwPVsOZFpzlivIV7dVJeNM=";
  # };
  # postInstall = ''
  # # install udev rules
  #   mkdir -p $out/etc/udev/rules.d/
  #   cp ./subprojects/steam-devices/*.rules $out/etc/udev/rules.d/
  #   substituteInPlace $out/etc/udev/rules.d/60-steam-input.rules \
  #     --replace "/bin/sh" "${pkgs.bash}/bin/bash"

  #   # this just installs a link, "steam.desktop -> /lib/steam/steam.desktop"
  #   rm $out/share/applications/steam.desktop
  #   sed -e 's,/usr/bin/steam,steam,g' steam.desktop > $out/share/applications/steam.desktop

  #   cp $srcmil/ext/bin/* $out/bin/
  #   mkdir -p $out/data
  #   cp -r $srcmil/ext/data/* $out/data/
  #   mkdir -p $out/lib
  #   cp $srcmil/libMillennium.so $out/lib/

  # '';
  # exportLDPath = oldAttrs.exportLDPath ++ ''
  #   export LD_LIBRARY_PATH=$out/lib/libMillennium.so
  # '';
})
