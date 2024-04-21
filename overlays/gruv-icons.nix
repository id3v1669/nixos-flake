{
  lib
, stdenvNoCC
, fetchFromGitHub
, gtk3
, plasma5Packages
, gnome-icon-theme
, hicolor-icon-theme
}:

stdenvNoCC.mkDerivation rec {
  pname = "gruvbox-plus-icon-pack";
  version = "5.3.1";

  src = fetchFromGitHub {
    owner = "SylEleuth";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-Y+wNmZTVWsg6Hn+fak71jnoZ72Cz/8YYpGWkKr4+C9Q=";
  };

  nativeBuildInputs = [ gtk3 ];

  propagatedBuildInputs = [ plasma5Packages.breeze-icons gnome-icon-theme hicolor-icon-theme ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/icons
    cp -r Gruvbox-Plus-Dark $out/share/icons/
    gtk-update-icon-cache $out/share/icons/Gruvbox-Plus-Dark

    runHook postInstall
  '';

  dontDropIconThemeCache = true;
  dontBuild = true;
  dontConfigure = true;
}