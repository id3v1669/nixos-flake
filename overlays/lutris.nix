{ pkgs
, ...
}: 
pkgs.lutris.override {
  extraPkgs = pkgs: with pkgs; [
    # -- sound
    speex
    speexdsp
    SDL2_sound
    openal
    wineasio

    giflib
    libpng
    openldap
    gnutls
    zenity
    mpg123
    libgpg-error
    libjpeg
    libgcrypt
    
    ocl-icd
    
    libxslt
    vulkan-loader
    gst_all_1.gst-plugins-base
    gst_all_1.gstreamer
    xorg.libXcomposite
    xorg.libXinerama
    (wine.override { wineBuild = "wine64"; })
    winetricks
    wineWowPackages.stableFull
    v4l-utils
    sqlite
    SDL2
    ncurses
    jansson
  ];
}