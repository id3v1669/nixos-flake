final: pkgs: {
  gruvbox-plus-icons = pkgs.stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "gruvbox-plus-icons";
  version = "6.1.1";

    src = pkgs.fetchFromGitHub {
      owner = "SylEleuth";
      repo = "gruvbox-plus-icon-pack";
      rev = "v${finalAttrs.version}";
      hash = "sha256-bDbOC9czQl95xoaAc2Wr1T6DZsnDEJtj2QbnUJfQ0i4=";
    };

    nativeBuildInputs = [ pkgs.gtk3 ];

    propagatedBuildInputs = with pkgs; [
      plasma5Packages.breeze-icons
      gnome-icon-theme
      hicolor-icon-theme
    ];

    installPhase = ''
      runHook preInstall

      mkdir -p $out/share/icons
      cp -r Gruvbox-Plus-Dark $out/share/icons/
      cp -r folders/grey/scalable/* $out/share/icons/Gruvbox-Plus-Dark/places/scalable/
      rm $out/share/icons/Gruvbox-Plus-Dark/apps/scalable/document-open-recent.svg
      gtk-update-icon-cache $out/share/icons/Gruvbox-Plus-Dark

      ln -sf $out/share/icons/Gruvbox-Plus-Dark/actions/symbolic/* $out/share/icons/Gruvbox-Plus-Dark/actions/16
      ln -sf $out/share/icons/Gruvbox-Plus-Dark/actions/symbolic/* $out/share/icons/Gruvbox-Plus-Dark/actions/16@2x
      ln -sf $out/share/icons/Gruvbox-Plus-Dark/actions/symbolic/* $out/share/icons/Gruvbox-Plus-Dark/actions/22
      ln -sf $out/share/icons/Gruvbox-Plus-Dark/actions/symbolic/* $out/share/icons/Gruvbox-Plus-Dark/actions/22@2x
      ln -sf $out/share/icons/Gruvbox-Plus-Dark/actions/symbolic/* $out/share/icons/Gruvbox-Plus-Dark/actions/24
      ln -sf $out/share/icons/Gruvbox-Plus-Dark/actions/symbolic/* $out/share/icons/Gruvbox-Plus-Dark/actions/24@2x
      ln -sf $out/share/icons/Gruvbox-Plus-Dark/actions/symbolic/* $out/share/icons/Gruvbox-Plus-Dark/actions/32
      ln -sf $out/share/icons/Gruvbox-Plus-Dark/actions/symbolic/* $out/share/icons/Gruvbox-Plus-Dark/actions/32@2x


      runHook postInstall
    '';

    dontDropIconThemeCache = true;
    dontBuild = true;
    dontConfigure = true;
  });
}
