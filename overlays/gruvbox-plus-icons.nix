final: pkgs: {
  gruvbox-plus-icons = pkgs.gruvbox-plus-icons.overrideAttrs (oldAttrs: rec {
    installPhase = ''
    runHook preInstall

    mkdir -p $out/share/icons
    cp -r Gruvbox-Plus-Dark $out/share/icons/
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
  });
}
