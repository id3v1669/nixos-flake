{ pkgs
, ...
}: 
pkgs.lutris.override {
  extraPkgs = pkgs: with pkgs; [
    giflib
    libpng
    openldap
    gnutls
    mpg123
    libgpg-error
    libjpeg
    libgcrypt
    ocl-icd
    libxslt
    vulkan-loader
    gst_all_1.gst-plugins-base
    xorg.libXcomposite
    xorg.libXinerama
    winetricks
    wine64Packages.stagingFull
    wineWowPackages.staging  
    openal
    v4l-utils
    sqlite
    ncurses
    jansson
  ];
}